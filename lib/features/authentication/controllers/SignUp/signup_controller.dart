import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AQGM/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:AQGM/data/user/user_repository.dart';
import 'package:AQGM/features/authentication/screens/signup/verify_email.dart';
import 'package:AQGM/utils/helpers/network_manager.dart';
import 'package:AQGM/utils/popups/full_screen_loader.dart';
import 'package:AQGM/utils/popups/loader.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();


  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs; // Observable for showing/hiding Password
  final privacyPolicy = true
      .obs; // Observable for showing/hiding PrivacyPolicy acceptance
  GlobalKey <FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      AQGMFullscreenLoader.openLoadingDialog(
          "We are processing your info...", AQGMImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        AQGMFullscreenLoader.stopLoading();
        return;}

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        AQGMFullscreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        AQGMLoader.warningSnackBar(title: "Accept Privacy Policy",
            message: "In order to create an account, you musr have to read & accept the privacy policy & terms of use"
        );
        return;
      }

      // Register user in Firebase Authentication & save user data in Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());


      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      AQGMFullscreenLoader.stopLoading();

      // Show Success Message
      AQGMLoader.successSnackBar(title: 'Congratulations ',
          message: 'your account has been created! Verify your email to continue.');

      // Move to verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      AQGMFullscreenLoader.stopLoading();

      // Show some Generic Error to the user
      AQGMLoader.errorSnackBar(title: "Oh snap!", message: e.toString());

    }
  }
}

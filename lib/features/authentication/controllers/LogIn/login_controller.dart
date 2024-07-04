import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:AQGM/features/personalization/controllers/user_controller.dart';
import '../../../../data/repositories/repository_authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loader.dart';


class LoginController extends GetxController {

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  /*@override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    email.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }*/

  /// -- Email & password signIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loader
      AQGMFullscreenLoader.openLoadingDialog(
          'Logging you in...', AQGMImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        AQGMFullscreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        AQGMFullscreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember me is selected
      if (!rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      AQGMFullscreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AQGMFullscreenLoader.stopLoading();
      AQGMLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// -- Google signIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      print('Opening loading dialog');
      AQGMFullscreenLoader.openLoadingDialog('Logging you in...', AQGMImages.docerAnimation);

      // Check Internet Connectivity
      print('Checking internet connectivity');
      final isConnected = await NetworkManager.instance.isConnected();
      print('Internet connectivity: $isConnected');
      if (!isConnected) {
        AQGMFullscreenLoader.stopLoading();
        AQGMLoader.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection and try again.');
        return;
      }

      // Google Authentication
      print('Signing in with Google');
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
      print('User credentials: $userCredentials');

      // Save user Record
      print('Saving user record');
      await userController.saveUserRecord(userCredentials);
      print('User record saved');

      // Remove loader
      print('Stopping loading dialog');
      AQGMFullscreenLoader.stopLoading();

      // Redirect
      print('Redirecting');
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // Remove loader
      print('Exception caught: $e');
      AQGMFullscreenLoader.stopLoading();
      AQGMLoader.errorSnackBar(title: 'Oh Snap', message: 'Sign in failed, please try again.\nError: $e');
    }
  }
}
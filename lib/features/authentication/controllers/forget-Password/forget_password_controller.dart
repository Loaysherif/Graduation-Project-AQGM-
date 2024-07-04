import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AQGM/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:AQGM/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:AQGM/utils/constants/image_strings.dart';
import 'package:AQGM/utils/helpers/network_manager.dart';
import 'package:AQGM/utils/popups/full_screen_loader.dart';
import 'package:AQGM/utils/popups/loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email  = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Forget Password email
  sendPasswordResetEmail()async{
    try{
      // Start Loading
      AQGMFullscreenLoader.openLoadingDialog('Processing your request....', AQGMImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {AQGMFullscreenLoader.stopLoading(); return;}

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        AQGMFullscreenLoader.stopLoading();
        return;
      }
      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      AQGMFullscreenLoader.stopLoading();

      //Show Success Screen
      AQGMLoader.successSnackBar(title: 'Email Sent', message: 'A link has been sent to reset your password'.tr);

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch(e){
      // Remove Loader
      AQGMFullscreenLoader.stopLoading();
      AQGMLoader.errorSnackBar(title: 'Oh Snap...!',message: e.toString());
    }
  }

  resendPasswordResetEmail(String email)async{
    try{
      // Start Loading
      AQGMFullscreenLoader.openLoadingDialog('Processing your request....', AQGMImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {AQGMFullscreenLoader.stopLoading(); return;}

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      AQGMFullscreenLoader.stopLoading();

      //Show Success Screen
      AQGMLoader.successSnackBar(title: 'Email Sent', message: 'A link has been sent to reset your password'.tr);

    } catch(e){
      // Remove Loader
      AQGMFullscreenLoader.stopLoading();
      AQGMLoader.errorSnackBar(title: 'Oh Snap...!',message: e.toString());
      }
    }
  }

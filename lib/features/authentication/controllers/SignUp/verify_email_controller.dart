import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:AQGM/common/widgets/success_screen/success_screen.dart';
import 'package:AQGM/utils/constants/image_strings.dart';
import 'package:AQGM/utils/constants/text_strings.dart';
import 'package:AQGM/utils/popups/loader.dart';

import '../../../../data/repositories/repository_authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get  instance => Get.find();

  /// Send Email whenever Verify screen appears & set timer for auto redirection.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try{
     await AuthenticationRepository.instance.sendEmailVerification();
     AQGMLoader.successSnackBar(title: 'Email Sent!', message: 'Please check your inbox and verify your email ');
    }catch(e){
      AQGMLoader.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
  /// Timer to automatically redirect an Email verification
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(() => SuccessScreen(
            onpressed: ()=> AuthenticationRepository.instance.screenRedirect(),
            title: AQGMTexts.yourAccountCreatedTitle,
            subTitle: AQGMTexts.yourAccountCreatedSubTitle,
            image: AQGMImages.successFullyRegisterAnimation)
        );
      }
    },
    );
  }
  /// Manually Check if Email is Verified
  checkEmailVerificationStatus(){
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
          onpressed: ()=> AuthenticationRepository.instance.screenRedirect(),
          title: AQGMTexts.yourAccountCreatedTitle,
          subTitle: AQGMTexts.yourAccountCreatedSubTitle,
          image: AQGMImages.successFullyRegisterAnimation)
      );
    }
  }
}
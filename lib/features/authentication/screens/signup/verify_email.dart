import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AQGM/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:AQGM/features/authentication/controllers/SignUp/verify_email_controller.dart';
import 'package:AQGM/utils/constants/image_strings.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/constants/text_strings.dart';
import 'package:AQGM/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerifyEmailController());
    return Scaffold(
      /// The close icon in the app bar is used to log out the user and redirect them to the login screen.
      /// This approach is token to handle scenarios where the user enters the registration process,
      /// and the data is stored,Upon reopening the app, it checks if the email is verified.
      /// If not verified, the app always navigates to the verification screen.
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        //padding to give default equal space on all sides in all screens
        child: Padding(
          padding: const EdgeInsets.all(AQGMSizes.defaultSpace),
          child: Column(
            children: [
              // IMAGE
              Image(
                image: const AssetImage(AQGMImages.deliveredEmailIllustration),
                width: AQGMHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: AQGMSizes.spaceBtwSections),

              // Title & Sub-Title
              Text(AQGMTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: AQGMSizes.spaceBtwItems),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: AQGMSizes.spaceBtwItems),
              Text(AQGMTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: AQGMSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(AQGMTexts.tocontinue),
                ),
              ),
              const SizedBox(height: AQGMSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(), child: const Text(AQGMTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

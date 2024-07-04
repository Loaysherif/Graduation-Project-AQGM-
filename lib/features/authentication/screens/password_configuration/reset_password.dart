import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AQGM/features/authentication/controllers/forget-Password/forget_password_controller.dart';
import 'package:AQGM/features/authentication/screens/login/login.dart';
import 'package:AQGM/utils/constants/image_strings.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/constants/text_strings.dart';
import 'package:AQGM/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AQGMSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(AQGMImages.deliveredEmailIllustration),
              width: AQGMHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: AQGMSizes.spaceBtwSections),

            // Title & Sub-Title
            Text(AQGMTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),

            const SizedBox(height: AQGMSizes.spaceBtwItems),

            Text(AQGMTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),

            const SizedBox(height: AQGMSizes.spaceBtwSections),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAll(() => const LogInScreen()),
                child: const Text(AQGMTexts.done),
              ),
            ),
            const SizedBox(height: AQGMSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(AQGMTexts.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}

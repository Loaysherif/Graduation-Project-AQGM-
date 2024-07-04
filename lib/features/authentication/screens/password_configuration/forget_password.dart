import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/constants/text_strings.dart';
import 'package:AQGM/utils/validators/validation.dart';

import '../../controllers/forget-Password/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AQGMSizes.defaultSpace),
        child: Column(
          children: [
            // Heding
            Text(AQGMTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              height: AQGMSizes.spaceBtwItems,
            ),
            Text(AQGMTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: AQGMSizes.spaceBtwSections * 2),

            // Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: AQGMValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: AQGMTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),

            const SizedBox(height: AQGMSizes.spaceBtwSections),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(AQGMTexts.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}

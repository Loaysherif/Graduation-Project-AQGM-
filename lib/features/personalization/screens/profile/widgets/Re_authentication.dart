import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:AQGM/features/personalization/controllers/user_controller.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/constants/text_strings.dart';
import 'package:AQGM/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.isntance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AQGMSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
              TextFormField(
                controller: controller.verifyEmail,
                validator: AQGMValidator.validateEmail,
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: AQGMTexts.email)),
                const SizedBox(height: AQGMSizes.spaceBtwInputFields),
                /// Password
                Obx(() => TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: (value) => AQGMValidator.validateEmptyText('Password',value),
                  decoration: InputDecoration(
                    labelText: AQGMTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =! controller.hidePassword.value,
                      icon: const Icon(Iconsax.eye_slash),
                    )
                  ),
                )),
                const SizedBox(height: AQGMSizes.spaceBtwSections),

                /// Verify Button
                SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed:() => controller.reAuthenticateEmailAndPassword(), child: Text('Verify'),),)

            ],),
          ),
        ),
      ),
    );
  }
}

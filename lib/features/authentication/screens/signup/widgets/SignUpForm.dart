import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:AQGM/features/authentication/controllers/SignUp/signup_controller.dart';
import 'package:AQGM/features/authentication/screens/signup/widgets/signup_checkbox.dart';
import 'package:AQGM/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = AQGMHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
        child: Column(
      children: [
        Row(
          /// First Name & Last Name
          children: [
            Expanded(
              child: TextFormField(
                validator: (value) => AQGMValidator.validateEmptyText("First name", value),
                controller: controller.firstName,
                expands: false,
                decoration: const InputDecoration(
                    labelText: AQGMTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),

            const SizedBox(
                  width: AQGMSizes.spaceBtwInputFields,),

            Expanded(
              child: TextFormField(
                validator: (value) => AQGMValidator.validateEmptyText("Last name", value),
                controller: controller.lastName,
                expands: false,
                decoration: const InputDecoration(
                    labelText: AQGMTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: AQGMSizes.spaceBtwInputFields,
        ),

        /// UserName
        TextFormField(
          validator: (value) => AQGMValidator.validateEmptyText("Username", value),
          controller: controller.username,
          expands: false,
          decoration: const InputDecoration(
              labelText: AQGMTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),

        const SizedBox(
          height: AQGMSizes.spaceBtwInputFields,),

        ///E-Mail
        TextFormField(
          validator: (value) => AQGMValidator.validateEmail(value),
          controller: controller.email,
          expands: false,
          decoration: const InputDecoration(
              labelText: AQGMTexts.email,
              prefixIcon: Icon(Iconsax.direct_right)),
        ),

        const SizedBox(
          height: AQGMSizes.spaceBtwInputFields,
        ),

        ///Phone Number
        TextFormField(
          validator: (value) => AQGMValidator.validatePhoneNumber(value),
          controller: controller.phoneNumber,
          expands: false,
          decoration: const InputDecoration(
              labelText: AQGMTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),

        const SizedBox(
          height: AQGMSizes.spaceBtwInputFields,
        ),

        ///Password
        Obx(() =>
          TextFormField(
            validator: (value) => AQGMValidator.validatePassword(value),
            controller: controller.password,
            obscureText: controller.hidePassword.value,
            expands: false,
            decoration:  InputDecoration(
                labelText: AQGMTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                    icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))
            ),
          ),
        ),

        const SizedBox(
          height: AQGMSizes.spaceBtwSections,
        ),

        /// Check Box
        SignupCheckbox(dark: dark),

        const SizedBox(
          height: AQGMSizes.spaceBtwSections,
        ),

        /// Create Account Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(AQGMTexts.createAccount)),
        ),
      ],
    ));
  }
}



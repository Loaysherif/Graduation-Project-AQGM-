import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/SignUp/signup_controller.dart';

class SignupCheckbox extends StatelessWidget {
  const SignupCheckbox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            width: 5.5,
            height: 24,
            child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value =!controller.privacyPolicy.value)
            )
        ),
        const SizedBox(width: AQGMSizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: AQGMTexts.iAgreeTo,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
              text: AQGMTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? AQGMColors.white : AQGMColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                dark ? AQGMColors.white : AQGMColors.primary,
              ),
            ),
            TextSpan(
                text: AQGMTexts.and,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: AQGMTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? AQGMColors.white : AQGMColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                    dark ? AQGMColors.white : AQGMColors.primary)),
          ]),
        ),
      ],
    );
  }
}
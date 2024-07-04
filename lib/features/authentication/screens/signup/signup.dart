import 'package:flutter/material.dart';
import 'package:AQGM/common/widgets/LogIn%20&%20SignUp/form_divider.dart';
import 'package:AQGM/common/widgets/LogIn%20&%20SignUp/social_buttons.dart';
import 'package:AQGM/features/authentication/screens/signup/widgets/SignUpForm.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AQGMSizes.defaultSpace),
          child: Column(
            children: [
              /// Title
              Text(
                AQGMTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AQGMSizes.spaceBtwSections,
              ),

              /// Form
              const SignUpForm(),
              const SizedBox(
                height: AQGMSizes.spaceBtwInputFields,
              ),

              /// Divider
              const FormDivider(dividerTexts: AQGMTexts.orSignUpWith),
              const SizedBox(
                height: AQGMSizes.spaceBtwInputFields,
              ),
              const SocialButtons()

            ],
          ),
        ),
      ),
    );
  }
}


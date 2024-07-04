import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AQGM/common/styles/spacing_styles.dart';
import 'package:AQGM/features/authentication/screens/login/widgets/login_form.dart';
import 'package:AQGM/features/authentication/screens/login/widgets/login_header.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/constants/text_strings.dart';
import '../../../../common/widgets/LogIn & SignUp/form_divider.dart';
import '../../../../common/widgets/LogIn & SignUp/social_buttons.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: AQGMSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            /// logo, title & sub-tile

            const LogInHeader(),

            /// Form
            const LogInForm(),

            /// Divider
            FormDivider(dividerTexts: AQGMTexts.orSignInWith.capitalize!),

            const SizedBox(height: AQGMSizes.spaceBtwSections),

            /// Footer
            const SocialButtons()
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:AQGM/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = AQGMHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 100,
          width: 500,
          image: AssetImage(
              dark ? AQGMImages.lightAppLogo : AQGMImages.darkAppLogo),
        ),
        const SizedBox(
          height: AQGMSizes.sm,
        ),
        Text(AQGMTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: AQGMSizes.sm,
        ),
        Text(AQGMTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
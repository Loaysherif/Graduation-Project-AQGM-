import 'package:flutter/material.dart';
import 'package:AQGM/features/authentication/controllers/OnBoarding/onboarding_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AQGMHelperFunctions.isDarkMode(context);
    return Positioned(
      top: AQGMDeviceUtils.getAppBarHeight(),
      right: AQGMSizes.defaultSpace * -0.25,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: Text('Skip',
            style: TextStyle(
                fontSize: 15,
                color: dark ? AQGMColors.light : AQGMColors.primary)),
      ),
    );
  }
}

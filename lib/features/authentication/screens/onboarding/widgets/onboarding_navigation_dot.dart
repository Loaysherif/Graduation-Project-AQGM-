import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:AQGM/features/authentication/controllers/OnBoarding/onboarding_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark =  AQGMHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: AQGMDeviceUtils.getBottomNavigationBarHeight(),
      left : AQGMSizes.defaultSpace *1.75,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect:  ExpandingDotsEffect(activeDotColor: dark? AQGMColors.light : AQGMColors.primary,dotHeight: 6),
      ),
    );
  }
}
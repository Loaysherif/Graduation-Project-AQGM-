import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/OnBoarding/onboarding_controller.dart';


class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark =  AQGMHelperFunctions.isDarkMode(context);
    return Positioned(
        right: AQGMSizes.defaultSpace,
        bottom: AQGMDeviceUtils.getBottomNavigationBarHeight()*0.75,
        child: ElevatedButton(
          onPressed: ()=> OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor:dark? AQGMColors.light: AQGMColors.primary),
          child:  Icon(Iconsax.arrow_right_3,color:dark? AQGMColors.dark: AQGMColors.light ,),
        ));
  }
}
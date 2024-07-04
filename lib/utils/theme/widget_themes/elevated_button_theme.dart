import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class  AQGMElevatedButtonTheme {
  AQGMElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor:  AQGMColors.light,
      backgroundColor:  AQGMColors.primary,
      disabledForegroundColor:  AQGMColors.darkGrey,
      disabledBackgroundColor:  AQGMColors.buttonDisabled,
      side: const BorderSide(color:  AQGMColors.primary),
      padding: const EdgeInsets.symmetric(vertical:  AQGMSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color:  AQGMColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( AQGMSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor:  AQGMColors.light,
      backgroundColor:  AQGMColors.primary,
      disabledForegroundColor:  AQGMColors.darkGrey,
      disabledBackgroundColor: AQGMColors.darkerGrey,
      side: const BorderSide(color:  AQGMColors.primary),
      padding: const EdgeInsets.symmetric(vertical:  AQGMSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color:  AQGMColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( AQGMSizes.buttonRadius)),
    ),
  );
}

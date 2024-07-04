import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class AQGMOutlinedButtonTheme {
  AQGMOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AQGMColors.dark,
      side: const BorderSide(color: AQGMColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: AQGMColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: AQGMSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AQGMSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AQGMColors.light,
      side: const BorderSide(color: AQGMColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: AQGMColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: AQGMSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AQGMSizes.buttonRadius)),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:AQGM/utils/theme/widget_themes/appbar_theme.dart';
import 'package:AQGM/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:AQGM/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:AQGM/utils/theme/widget_themes/chip_theme.dart';
import 'package:AQGM/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:AQGM/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:AQGM/utils/theme/widget_themes/text_field_theme.dart';
import 'package:AQGM/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class AQGMAppTheme {
  AQGMAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor:  AQGMColors.grey,
    brightness: Brightness.light,
    primaryColor:  AQGMColors.primary,
    textTheme: AQGMTextTheme.lightTextTheme,
    chipTheme: AQGMChipTheme.lightChipTheme,
    scaffoldBackgroundColor:  AQGMColors.white,
    appBarTheme: AQGMAppBarTheme.lightAppBarTheme,
    checkboxTheme: AQGMCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AQGMBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AQGMElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AQGMOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AQGMTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor:  AQGMColors.grey,
    brightness: Brightness.dark,
    primaryColor:  AQGMColors.primary,
    textTheme: AQGMTextTheme.darkTextTheme,
    chipTheme: AQGMChipTheme.darkChipTheme,
    scaffoldBackgroundColor:  AQGMColors.black,
    appBarTheme: AQGMAppBarTheme.darkAppBarTheme,
    checkboxTheme: AQGMCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AQGMBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AQGMElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AQGMOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AQGMTextFormFieldTheme.darkInputDecorationTheme,
  );
}

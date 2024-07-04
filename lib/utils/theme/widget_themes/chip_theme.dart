import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class  AQGMChipTheme {
  AQGMChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor:  AQGMColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color:  AQGMColors.black),
    selectedColor:  AQGMColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor:  AQGMColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor:  AQGMColors.darkerGrey,
    labelStyle: TextStyle(color:  AQGMColors.white),
    selectedColor: AQGMColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor:  AQGMColors.white,
  );
}

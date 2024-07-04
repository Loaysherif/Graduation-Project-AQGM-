import 'package:flutter/material.dart';
import 'package:AQGM/utils/constants/colors.dart';

class AQGMBottomSheetTheme {
  AQGMBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor:  AQGMColors.white,
    modalBackgroundColor:  AQGMColors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor:  AQGMColors.black,
    modalBackgroundColor:  AQGMColors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}

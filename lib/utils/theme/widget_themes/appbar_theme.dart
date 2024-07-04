import 'package:flutter/material.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class  AQGMAppBarTheme{
  AQGMAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color:  AQGMColors.black, size:  AQGMSizes.iconMd),
    actionsIconTheme: IconThemeData(color:  AQGMColors.black, size:  AQGMSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color:  AQGMColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color:  AQGMColors.black, size:  AQGMSizes.iconMd),
    actionsIconTheme: IconThemeData(color:  AQGMColors.white, size:  AQGMSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color:  AQGMColors.white),
  );
}
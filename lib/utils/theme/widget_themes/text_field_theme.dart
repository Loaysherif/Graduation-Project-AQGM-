import 'package:flutter/material.dart';
import 'package:AQGM/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class AQGMTextFormFieldTheme {
  AQGMTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AQGMColors.darkGrey,
    suffixIconColor: AQGMColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: AQGMSizes.fontSizeMd, color: AQGMColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: AQGMSizes.fontSizeSm, color:AQGMColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: AQGMColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AQGMColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AQGMColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AQGMColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AQGMColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AQGMColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AQGMColors.darkGrey,
    suffixIconColor: AQGMColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: AQGMSizes.fontSizeMd, color: AQGMColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: AQGMSizes.fontSizeSm, color: AQGMColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: AQGMColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AQGMColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color:AQGMColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AQGMColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AQGMColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AQGMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AQGMColors.warning),
    ),
  );
}

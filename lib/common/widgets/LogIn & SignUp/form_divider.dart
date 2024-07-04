import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AQGM/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerTexts
  });

  final String dividerTexts;

  @override
  Widget build(BuildContext context) {
    final dark = AQGMHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? AQGMColors.darkerGrey : AQGMColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(AQGMTexts.orSignInWith.capitalize!,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
          color: dark ? AQGMColors.darkerGrey : AQGMColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        ))
      ],
    );
  }
}

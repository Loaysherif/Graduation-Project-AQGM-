// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:AQGM/common/styles/spacing_styles.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  SuccessScreen(
      {super.key,
      required this.onpressed,
      required this.title,
      required this.subTitle,
      required this.image});

  String image, title, subTitle;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AQGMSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(image),
                width: AQGMHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: AQGMSizes.spaceBtwSections),

              // Title & Sub-Title
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: AQGMSizes.spaceBtwItems),
              const SizedBox(height: AQGMSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: AQGMSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onpressed,
                  child: const Text(AQGMTexts.tocontinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

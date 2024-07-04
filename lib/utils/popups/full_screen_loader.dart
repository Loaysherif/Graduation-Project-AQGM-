import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class AQGMFullscreenLoader {
  /// Open a full-screen Loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// Parameters：
  ///  - text: The text to be displayed in the loading dialog.
  ///  - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // Use Get.overlayContext for overlay dialogs
      barrierDismissible: false,
      // The dialog can't be dismissed by tapping outside it
      builder: (_) =>
          PopScope(
            canPop: false, // Disable popping with the back button
            child: Container(
              color: AQGMHelperFunctions.isDarkMode(Get.context!)
                  ? AQGMColors.dark
                  : AQGMColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(children: [
                const SizedBox(height: 250), // Adjust the spacing as needed
                AQGMAnimationLoaderWidget(text: text, animation: animation),
              ],
              ),
            ),
          ),
    );
  }
  /// Stop the currently open loading dialog.
  /// This method does not return anything
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); // Close the dialogue using Navigator
  }
}

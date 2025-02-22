import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:AQGM/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController
{

  static OnBoardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index When Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & Jump to the next page
  void nextPage(){
    if(currentPageIndex.value == 2){
       final storage = GetStorage();
       if (kDebugMode){
         print("--------------Get Storage Next Button-------------");
         print(storage.read("IsFirstTime"));
       }
       storage.write("IsFirstTime", false);
       if (kDebugMode){
         print("--------------Get Storage Next Button-------------");
         print(storage.read("IsFirstTime"));
       }

       Get.offAll(const LogInScreen());
    } else{
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to the last page
  void skipPage(){
   Get.offAll(const LogInScreen());
  }



}
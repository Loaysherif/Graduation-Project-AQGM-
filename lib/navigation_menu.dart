import 'package:AQGM/savedquestionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:AQGM/features/generation_app/screens/Home/home.dart';
import 'package:AQGM/features/personalization/screens/settings/settings.dart';
import 'package:AQGM/utils/constants/colors.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar: Obx(
          ()=> NavigationBar(
            indicatorColor: Colors.transparent,
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home,color: AQGMColors.primary), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.bookmark,color: AQGMColors.primary), label: "Saved Questions"),
              NavigationDestination(icon: Icon(Iconsax.setting,color: AQGMColors.primary), label: "Settings")
            ],
          ),
        ),
        body:  Obx(()=> controller.screens[controller.selectedIndex.value]));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
     HomeScreen(),
    SavedQuestionsScreen(),
     SettingsScreen(),
  ];
}

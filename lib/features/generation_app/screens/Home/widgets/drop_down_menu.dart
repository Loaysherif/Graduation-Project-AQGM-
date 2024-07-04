import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AQGM/utils/constants/colors.dart';
import 'drop_down_menu_controller.dart';
 // Adjust the import path accordingly

class DropdownMenuWidget extends StatelessWidget {
  const DropdownMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DropdownController()); // Registering the controller with GetX

    return Obx(() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        value: controller.selectedItem.value, // This will be null initially
        hint: const Text('Select Qestion Type',style: TextStyle(color: AQGMColors.primary),), // Shown when `value` is null
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isDense: true, // Add this line
        isExpanded: true, // Add this line
        style: const TextStyle(color: Colors.black, fontSize: 18),
        onChanged: (newValue) {
          controller.changeSelectedItem(newValue);
        },
        items: controller.dropdownItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style: const TextStyle(color: AQGMColors.primary),),
          );
        }).toList(),
      ),
    ));
  }
}



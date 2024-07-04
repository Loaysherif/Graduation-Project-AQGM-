import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandingTextField extends StatelessWidget {
  static final TextEditingController controller = Get.put(TextEditingController());

   ExpandingTextField({super.key ,controller});

  @override
  Widget build(BuildContext context) {
    return  Obx(
            () => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(constraints:
              const BoxConstraints(
                minHeight: 50.0, // Minimum height for the TextField
                maxHeight: 300.0, // Maximum height for the TextField
              ),
              child: TextFormField(
               expands: true,
              onChanged: (value) => controller.text = value,
              maxLines: null, // Allows the TextField to expand vertically
              controller: TextEditingController(text: controller.text)
                ..selection = TextSelection.collapsed(
                    offset: controller.text.length),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter your text here',
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    // Also clear the text field's controller
                    // This is needed to reflect the change in the UI
                    TextEditingController().clear();
                  },
                )
                    : null,
              ),
                        ),
            ),
        ),
    );


  }
}
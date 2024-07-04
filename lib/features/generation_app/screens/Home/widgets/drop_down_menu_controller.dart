import 'package:get/get.dart';

class DropdownController extends GetxController {
  // Rxn<T> can be null.
  var selectedItem = RxnString();

  List<String> dropdownItems = [
    'Wh',
    'MCQ',
    'T/F',
  ];

  void changeSelectedItem(String? value) {
    selectedItem.value = value;
  }
}

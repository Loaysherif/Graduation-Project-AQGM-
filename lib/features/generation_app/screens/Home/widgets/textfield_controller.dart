import 'package:get/get.dart';

class TextFieldController extends GetxController {
  var text = ''.obs;

  void clearText() {
    text.value = '';
  }
}

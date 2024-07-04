import 'dart:convert';
import 'package:AQGM/features/generation_app/screens/Home/widgets/drop_down_menu_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final controller = Get.put(DropdownController());

  ApiService({required this.baseUrl});

  Future<List<Map<String, dynamic>>> generateQuestions(String text) async {
    final response = await http.post(
      Uri.parse('$baseUrl/QuestionGeneration'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'quizText': text,
        'questionType': controller.selectedItem.value,
      }),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      if (responseData is List) {
        return responseData.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to generate questions');
    }
  }
}

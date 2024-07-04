import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:AQGM/utils/http/http_client.dart'; // Assuming this is your HTTP client service
import 'package:firebase_auth/firebase_auth.dart';

class CreateButtonController extends GetxController {
  final ApiService apiService = ApiService(baseUrl: 'https://0d45-35-240-199-203.ngrok-free.app');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController textController = TextEditingController();
  var isLoading = false.obs;
  var questions = <Map<String, dynamic>>[].obs;
  var savedQuestions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSavedQuestions();
  }

  void setLoading(bool value) {
    isLoading.value = value;
  }

  Future<void> generateQuestions() async {
    if (textController.text.isEmpty) {
      questions.value = [];
    } else {
      isLoading.value = true;
      try {
        final response = await apiService.generateQuestions(textController.text);
        questions.value = response;
      } catch (e) {
        questions.value = [];
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> saveQuestion(String question, String answer) async {
    User? user = auth.currentUser;
    if (user != null) {
      await firestore.collection('users').doc(user.uid).collection('questions').add({
        'question': question,
        'answer': answer,
        'timestamp': FieldValue.serverTimestamp(),
      });
      fetchSavedQuestions(); // Refresh saved questions after saving
    } else {
      print('User not authenticated.');
      // Handle case where user is not authenticated
    }
  }

  Future<void> fetchSavedQuestions() async {
    User? user = auth.currentUser;
    if (user != null) {
      try {
        final QuerySnapshot snapshot = await firestore
            .collection('users')
            .doc(user.uid)
            .collection('questions')
            .get();
        savedQuestions.assignAll(snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());
      } catch (e) {
        print('Error fetching saved questions: $e');
        savedQuestions.clear(); // Clear saved questions if there's an error
      }
    }
  }


  Future<void> deleteQuestion(String documentId) async {
    User? user = auth.currentUser;
    if (user != null) {
      await firestore.collection('users').doc(user.uid).collection('questions').doc(documentId).delete();
      fetchSavedQuestions(); // Refresh saved questions after deleting
    }
  }

  bool isSavedQuestion(Map<String, dynamic> question) {
    return savedQuestions.any((savedQuestion) =>
    savedQuestion['question'] == question['question'] && savedQuestion['answer'] == question['answer']);
  }

  void toggleSaveQuestion(Map<String, dynamic> question) {
    if (isSavedQuestion(question)) {
      deleteQuestion(question['id']); // Ensure 'id' matches your document ID field
    } else {
      saveQuestion(question['question'], question['answer']);
    }
  }
}




class GenerateButton extends GetWidget<CreateButtonController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TextField(
              controller: controller.textController,
              decoration: InputDecoration(hintText: 'Enter text'),
              maxLines: null,
            ),
          ),
        ),
        SizedBox(height: 20),
        Obx(() => controller.isLoading.value
            ? Container()
            : ElevatedButton(
          onPressed: controller.generateQuestions,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            elevation: 2,
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text('Generate Questions'),
        )),
      ],
    );
  }
}
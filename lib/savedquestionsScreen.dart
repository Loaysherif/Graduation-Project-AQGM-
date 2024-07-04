import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:AQGM/utils/http/http_client.dart'; // Assuming this is your HTTP client service
import 'package:firebase_auth/firebase_auth.dart';

class SavedQuestionsScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Questions'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: _fetchSavedQuestionsStream(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final questions = snapshot.data!.docs;

              if (questions.isEmpty) {
                return Center(child: Text('No saved questions.'));
              }

              return ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index].data() as Map<String, dynamic>;
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        'Q: ${question['question']}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'A: ${question['answer']}',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteQuestion(question),
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> _fetchSavedQuestionsStream() {
    User? user = auth.currentUser;
    if (user != null) {
      return firestore.collection('users').doc(user.uid).collection('questions').snapshots();
    } else {
      throw Exception('User not authenticated.');
    }
  }

  Future<void> _deleteQuestion(Map<String, dynamic> question) async {
    User? user = auth.currentUser;
    if (user != null) {
      final querySnapshot = await firestore
          .collection('users')
          .doc(user.uid)
          .collection('questions')
          .where('question', isEqualTo: question['question'])
          .where('answer', isEqualTo: question['answer'])
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } else {
      throw Exception('User not authenticated.');
    }
  }
}

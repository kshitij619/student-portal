import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class PredictionViewModel extends ChangeNotifier {
  String predictionString = '';
  List<String> suggestionsList = [];
  Map<String, dynamic> predictionMap = {};

  bool isLoading = false;

  final cgpaController = TextEditingController();
  final twelfthController = TextEditingController();
  final tenthController = TextEditingController();
  final backlogController = TextEditingController();
  final skillsController = TextEditingController();
  String? majorProjectController;
  String? miniProjectController;
  String? communicationController;
  String? certificateController;
  bool? internshipsController;
  bool? hackathonsController;

  final String _baseUrl = 'https://mini06.onrender.com/predict';

  Future<void> getPredictionResult(String user) async {
    log('getPredictionResult called');
    isLoading = true;
    notifyListeners();
    final skills = skillsController.text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    try {
      predictionMap = {
        'input': [
          double.parse(cgpaController.text),
          int.parse(majorProjectController.toString()),
          int.parse(certificateController.toString()),
          int.parse(miniProjectController.toString()),
          int.parse(skills.length.toString()),
          int.parse(communicationController.toString()),
          double.parse(twelfthController.text),
          double.parse(tenthController.text),
          int.parse(backlogController.text),
          (internshipsController ?? false) ? 1 : 0,
          (hackathonsController ?? false) ? 1 : 0,
        ],
      };

      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(predictionMap),
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      final decoded = jsonDecode(response.body);
      final String prediction = decoded['prediction'];
      final List<String> suggestions =
          List<String>.from(decoded['suggestions']);
      log(prediction);
      log(suggestions.toString());
      predictionString = prediction;
      suggestionsList = suggestions;

      await FirebaseFirestore.instance.collection('predictions').add({
        'prediction': prediction,
        'suggestions': suggestions,
        'user': user,
        'timestamp': FieldValue.serverTimestamp(),
        'parameters': predictionMap['input'],
      });
    } catch (e, s) {
      throw ('Error: $e', stackTrace: s);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

// Response body: {
//   "prediction":"Placed",

//   "suggestions": [
//       "Start working on 1-2 mini-projects related to your major.",
//       "Target 1-2 relevant certifications (e.g., AWS, Google Cloud, specific programming languages).",
//       "Build a portfolio website to showcase your skills and projects.",
//       "Practice coding challenges on platforms like LeetCode, HackerRank.",
//       "Participate in a hackathon for practical experience and networking.",
//       "Actively search and apply for internships, even if unpaid.",
//       "Prepare a strong resume highlighting your CGPA and communication skills.",
//       "Practice your technical and behavioral interview skills.",
//       "Network with professionals in your field through LinkedIn and career fairs.",
//       "Consider contributing to open-source projects to gain experience."
//     ]
// }

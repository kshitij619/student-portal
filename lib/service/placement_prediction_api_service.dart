import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class PlacementPredictionApiService {
  final String _baseUrl = "https://mini06.onrender.com/predict";

  Map<String, dynamic> requestData = {
    "input": [
      8.5, // CGPA
      2, // Major Projects
      3, // Workshops/Certifications
      1, // Mini Projects
      5, // Skills
      7, // Communication Skill Rating
      85, // 12th Percentage
      90, // 10th Percentage
      0, // Backlogs
      1, // Internship_Yes
      0 // Hackathon_Yes
    ]
  };

  Future<String> getPredictionResult() async {
    log('getPredictionResult called');
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestData),
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      log('Response: ${response.body.substring(15, response.body.length - 3)}');
      log('Response: ${response.body}');
      log(response.request.toString());

      final String prediction =
          response.body.substring(15, response.body.length - 3);
      return prediction;
    } catch (e, s) {
      throw ('Error: $e', stackTrace: s);
    }
  }
}

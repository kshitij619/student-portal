import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class PredictionViewModel extends ChangeNotifier {
  String predictionString = '';
  Map<String, dynamic> predictionMap = {};

  bool isLoading = false;

  final cgpaController = TextEditingController();
  final twelfthController = TextEditingController();
  final tenthController = TextEditingController();
  final backlogController = TextEditingController();
  String? majorProjectController;
  String? miniProjectController;
  String? skillsController;
  String? communicationController;
  String? certificateController;
  bool? internshipsController;
  bool? hackathonsController;

  final String _baseUrl = "https://mini06.onrender.com/predict";

  Future<void> getPredictionResult(String user) async {
    log('getPredictionResult called');
    isLoading = true;
    notifyListeners();

    try {
      predictionMap = {
        'input': [
          double.parse(cgpaController.text),
          int.parse(majorProjectController.toString()),
          int.parse(certificateController.toString()),
          int.parse(miniProjectController.toString()),
          int.parse(skillsController.toString()),
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
      log(prediction);
      predictionString = prediction;

      await FirebaseFirestore.instance.collection('predictions').add({
        'prediction': prediction,
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

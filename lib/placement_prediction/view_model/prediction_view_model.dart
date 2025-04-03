// import 'dart:developer';

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:mini_project_sem_6/service/placement_prediction_api_service.dart';

class PredictionViewModel extends ChangeNotifier {
  String predictionString = '';
  List predictionList = [];
  final PlacementPredictionApiService _service =
      PlacementPredictionApiService();

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

  void predictPlacementProbability() async {
    // predictionString =
    //     'cgpa:${cgpaController.text} major:$majorProjectController mini:$miniProjectController certifications: $certificateController skills:$skillsController communication:$communicationController certificates:$certificateController 10th:${tenthController.text} 12th:${twelfthController.text} backlogs: ${backlogController.text} internships:$internshipsController hackathon:$hackathonsController';
    Map<String, dynamic> predictionList = {
      'input': [
        cgpaController.text as Float,
        majorProjectController as int,
        certificateController as int,
        miniProjectController as int,
        skillsController as int,
        communicationController as int,
        twelfthController as Float,
        tenthController as Float,
        backlogController as int,
        internshipsController as int,
        hackathonsController as int,
      ],
    };
    predictionString = await _service.getPredictionResult();

    notifyListeners();
  }
}

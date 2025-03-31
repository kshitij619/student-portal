import 'dart:developer';

import 'package:flutter/cupertino.dart';

class PredictionViewModel extends ChangeNotifier {
  String predictionString = '';

  final cgpaController = TextEditingController();
  String? majorProjectController;
  String? miniProjectController;
  String? internshipsController;
  final departmentController = TextEditingController();
  final skillsController = TextEditingController();

/*
*
*
*
*
*
*/
  void predictPlacementProbability() {
    predictionString =
        '${cgpaController.text}  ${majorProjectController.toString()} ${miniProjectController.toString()} ${internshipsController.toString()}'; //$departmentController $skillsController';
    notifyListeners();
  }
}

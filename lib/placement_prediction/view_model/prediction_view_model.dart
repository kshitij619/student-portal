import 'dart:developer';

import 'package:flutter/cupertino.dart';

class PredictionViewModel extends ChangeNotifier {
  String predictionString = '';
  void predictPlacementProbability({
    required double? cgpa,
    required int? internships,
    required int? currentYear,
    required String? department,
    required String? skills,
  }) {
    predictionString =
        '${cgpa.toString()} ${internships.toString()} ${currentYear.toString()} $department $skills';
    log(predictionString);
    notifyListeners();
  }
}

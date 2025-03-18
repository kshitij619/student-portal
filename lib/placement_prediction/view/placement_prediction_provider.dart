import 'package:flutter/cupertino.dart';
import 'package:mini_project_sem_6/placement_prediction/view/placement_prediction_page.dart';
import 'package:mini_project_sem_6/placement_prediction/view_model/prediction_view_model.dart';
import 'package:provider/provider.dart';

class PlacementPredictionProvider extends StatelessWidget {
  const PlacementPredictionProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PredictionViewModel(),
      child: const PlacementPredictionPage(),
    );
  }
}

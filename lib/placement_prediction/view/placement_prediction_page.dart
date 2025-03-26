import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/default_icon.dart';
import 'package:mini_project_sem_6/placement_prediction/view/widgets/prediction_form.dart';

class PlacementPredictionPage extends StatelessWidget {
  const PlacementPredictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: DefaultIcon(icon: Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        }),
        title: Text(
          'Predict your Placement',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 24,
          ),
        ),
      ),
      body: const PredictionForm(),
    );
  }
}

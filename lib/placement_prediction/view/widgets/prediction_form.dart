import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/placement_prediction/view_model/prediction_view_model.dart';
import 'package:provider/provider.dart';

class PredictionForm extends StatefulWidget {
  const PredictionForm({super.key});

  @override
  State<PredictionForm> createState() => _PredictionFormState();
}

class _PredictionFormState extends State<PredictionForm> {
  final cgpaController = TextEditingController();
  final internshipsController = TextEditingController();
  final currentYearController = TextEditingController();
  final departmentController = TextEditingController();
  final skillsController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String prediction = context.watch<PredictionViewModel>().predictionString;
    return Form(
      key: formKey,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Average CGPA:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextField(
                    controller: cgpaController,
                    decoration: InputDecoration(hintText: 'CGPA'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Internships:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextField(
                    controller: internshipsController,
                    decoration:
                        InputDecoration(hintText: 'Number of Internships'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Current year:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextField(
                    controller: currentYearController,
                    decoration: InputDecoration(hintText: 'Current year'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Department:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextField(
                    controller: departmentController,
                    decoration: InputDecoration(hintText: 'Department'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Skills:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextField(
                    controller: skillsController,
                    decoration: InputDecoration(hintText: 'Skills'),
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // setState(() {
                        //   prediction = Random().nextInt(99);
                        //   developer.log(prediction.toString());
                        // });
                        _onPredictionButtonPressed(context);
                      },
                      child: Text('Predict'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      prediction,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onPredictionButtonPressed(BuildContext context) {
    setState(() {
      if (formKey.currentState?.validate() == true) {
        developer.log('Called onPredictionButtonPressed()');
        context.read<PredictionViewModel>().predictPlacementProbability(
              cgpa: double.tryParse(cgpaController.text),
              internships: int.tryParse(internshipsController.text),
              currentYear: int.tryParse(currentYearController.text),
              department: departmentController.text.toString(),
              skills: skillsController.text.toString(),
            );
        cgpaController.clear();
        internshipsController.clear();
        currentYearController.clear();
        departmentController.clear();
        skillsController.clear();
      }
    });
  }

  @override
  void dispose() {
    cgpaController.dispose();
    internshipsController.dispose();
    currentYearController.dispose();
    departmentController.dispose();
    skillsController.dispose();
    super.dispose();
  }
}

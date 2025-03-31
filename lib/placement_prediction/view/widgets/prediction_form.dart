import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/placement_prediction/view/widgets/custom_dropdown_menu.dart';
import 'package:mini_project_sem_6/placement_prediction/view_model/prediction_view_model.dart';
import 'package:provider/provider.dart';

class PredictionForm extends StatefulWidget {
  const PredictionForm({super.key});

  @override
  State<PredictionForm> createState() => _PredictionFormState();
}

class _PredictionFormState extends State<PredictionForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final predictionModel = Provider.of<PredictionViewModel>(context);
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Average CGPA:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextField(
                        controller: predictionModel.cgpaController,
                        decoration: InputDecoration(hintText: 'CGPA'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Major Projects:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomDropdownMenu(
                          controller: predictionModel.majorProjectController),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Mini Projects:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomDropdownMenu(
                          controller: predictionModel.miniProjectController)
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Internships:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomDropdownMenu(
                          controller: predictionModel.internshipsController)
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Department:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextField(
                        controller: predictionModel.departmentController,
                        decoration: InputDecoration(hintText: 'Department'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skills:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextField(
                        controller: predictionModel.skillsController,
                        decoration: InputDecoration(hintText: 'Skills'),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          log(prediction.toString());
                        });
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
        log('Called onPredictionButtonPressed()');
        context.read<PredictionViewModel>().predictPlacementProbability();
      }
    });
  }

  // @override
  // void dispose() {
  //   cgpaController.dispose();
  //   internshipsController.dispose();
  //   departmentController.dispose();
  //   skillsController.dispose();
  //   super.dispose();
  // }
}

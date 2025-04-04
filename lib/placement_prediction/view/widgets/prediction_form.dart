import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/placement_prediction/view/widgets/custom_dropdown_menu.dart';
import 'package:mini_project_sem_6/placement_prediction/view_model/prediction_view_model.dart';
import 'package:mini_project_sem_6/service/placement_prediction_api_service.dart';
import 'package:provider/provider.dart';

List boolList = ['Yes', 'No'];

class PredictionForm extends StatefulWidget {
  const PredictionForm({super.key});

  @override
  State<PredictionForm> createState() => _PredictionFormState();
}

class _PredictionFormState extends State<PredictionForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final predictionViewModel = Provider.of<PredictionViewModel>(context);
    String prediction = context.watch<PredictionViewModel>().predictionString;
    final PlacementPredictionApiService _service =
        PlacementPredictionApiService();

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
                    // CGPA
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Average CGPA:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextField(
                        controller: predictionViewModel.cgpaController,
                        decoration: InputDecoration(hintText: 'e.g. 8.9'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // Major Projects
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Major Projects:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomDropdownMenu(
                        controller: predictionViewModel.majorProjectController,
                        onChanged: (newValue) {
                          setState(() {
                            predictionViewModel.majorProjectController =
                                newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // Mini Projects
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Mini Projects:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomDropdownMenu(
                        controller: predictionViewModel.miniProjectController,
                        onChanged: (newValue) {
                          setState(() {
                            predictionViewModel.miniProjectController =
                                newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // Workshops/Certification
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Workshops/Certification:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomDropdownMenu(
                        controller: predictionViewModel.certificateController,
                        onChanged: (newValue) {
                          setState(() {
                            predictionViewModel.certificateController =
                                newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // Skills
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skills:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomDropdownMenu(
                        controller: predictionViewModel.skillsController,
                        onChanged: (newValue) {
                          setState(() {
                            predictionViewModel.skillsController = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    //Communication Skills
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Communication Skills Rating:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      CustomDropdownMenu(
                        controller: predictionViewModel.communicationController,
                        onChanged: (newValue) {
                          setState(() {
                            predictionViewModel.communicationController =
                                newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // 12th percentage
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '12th percentage:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextField(
                        controller: predictionViewModel.twelfthController,
                        decoration: InputDecoration(hintText: 'e.g. 84'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // 10th percentage
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10th percentage:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextField(
                        controller: predictionViewModel.tenthController,
                        decoration: InputDecoration(hintText: 'e.g. 92'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // Backlogs
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of backlogs/KTs:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextField(
                        controller: predictionViewModel.backlogController,
                        decoration: InputDecoration(
                            hintText: "Type '0' in case of no backlog/KT"),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // Internships
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Did any internships?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<bool>(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            value: predictionViewModel.internshipsController,
                            isExpanded: true,
                            items: [
                              DropdownMenuItem<bool>(
                                value: true,
                                child: Text('Yes'),
                              ),
                              DropdownMenuItem(
                                value: false,
                                child: Text('No'),
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                predictionViewModel.internshipsController =
                                    value;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    // Hackathons
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Did you win any hackathons?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<bool>(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            value: predictionViewModel.hackathonsController,
                            isExpanded: true,
                            items: [
                              DropdownMenuItem<bool>(
                                value: true,
                                child: Text('Yes'),
                              ),
                              DropdownMenuItem(
                                value: false,
                                child: Text('No'),
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                predictionViewModel.hackathonsController =
                                    value;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          log(prediction.toString());
                        });
                        // await _service.getPredictionResult();
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

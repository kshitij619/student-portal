import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/default_icon.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/student_details.dart';
import 'package:mini_project_sem_6/placement_prediction/view/placement_prediction_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: DefaultIcon(icon: Icons.menu_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: DefaultIcon(icon: Icons.logout_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Features',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 3,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Placement Prediction'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PlacementPredictionProvider(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: StudentDetails(),
    );
  }
}

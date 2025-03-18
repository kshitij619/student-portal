import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/auth/view/login_screen.dart';
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
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
          ],
        ),
      ),
      body: const PredictionForm(),
    );
  }
}

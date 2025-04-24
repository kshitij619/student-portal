import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/dashboard/view-model/dashboard_view_model.dart';
import 'package:mini_project_sem_6/dashboard/view/screens/dashboard_page.dart';
import 'package:provider/provider.dart';

class DashboardProvider extends StatelessWidget {
  const DashboardProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DashboardViewModel(),
      child: const DashboardPage(),
    );
  }
}

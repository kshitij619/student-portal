import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/auth/view-model/auth_service.dart';
import 'package:mini_project_sem_6/dashboard/model/student_details_model.dart';
import 'package:mini_project_sem_6/dashboard/view-model/dashboard_view_model.dart';
import 'package:mini_project_sem_6/widgets/feedback_icon.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/default_icon.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);

    final email = auth.user?.email;
    final dashboardViewModel = Provider.of<DashboardViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: DefaultIcon(icon: Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButton: const FeedbackIcon(),
      body: SingleChildScrollView(
        child: FutureBuilder<StudentDetailsModel?>(
          future: dashboardViewModel.fetchUserByEmail(email as String),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final profile = snapshot.data;
            if (profile == null) {
              return const Center(child: Text('No student found'));
            }

            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage(profile.image),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        profile.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text('Email: ${profile.email}',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('Roll Number: ${profile.rollNumber}',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('Phone: ${profile.phone}',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('Address: ${profile.address}',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('Gender: ${profile.gender.name}',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('Department: ${profile.department}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

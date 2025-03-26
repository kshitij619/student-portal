import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/default_icon.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/student_details.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            const Color.fromARGB(255, 195, 236, 255),
          ),
        ),
        onPressed: () {},
        child: Icon(
          Icons.chat_bubble,
          color: Colors.black,
        ),
      ),
      body: StudentDetails(),
    );
  }
}

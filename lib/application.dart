import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/auth/view/login_screen.dart';
import 'package:mini_project_sem_6/dashboard/view/screens/home_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
    );
  }
}

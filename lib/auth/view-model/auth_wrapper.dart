import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/auth/view-model/auth_service.dart';
import 'package:mini_project_sem_6/auth/view/login_screen.dart';
import 'package:mini_project_sem_6/dashboard/view/screens/home_page.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    if (authService.user != null) {
      return HomePage();
    } else {
      return LoginScreen();
    }
  }
}

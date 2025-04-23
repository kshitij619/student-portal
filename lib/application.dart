import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/auth/view-model/auth_service.dart';
import 'package:mini_project_sem_6/auth/view-model/auth_wrapper.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: 'assets/gif/SplashAnimation.gif',
          centered: true,
          splashIconSize: 1200,
          duration: 3000,
          nextScreen: const AuthWrapper(),
        ),
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}

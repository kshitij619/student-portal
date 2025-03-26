import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/auth/view-model/auth_service.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SizedBox(
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'College Email Id:',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'College email id',
                ),
                controller: emailController,
              ),
              SizedBox(height: 16),
              Text(
                'Password:',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                controller: passwordController,
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await authService.signInWithEmail(
                        emailController.text,
                        passwordController.text,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

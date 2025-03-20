import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/dashboard/view/screens/dashboard_page.dart';
import 'package:mini_project_sem_6/dashboard/view/screens/home_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
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
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
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

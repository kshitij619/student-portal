import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/navigation_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.person,
          size: 80,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student Full Name',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '223063101',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, -850),
            child: Transform.scale(
              scale: 3.5,
              child: Image.asset(
                'lib/assets/images/bgCircle.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              children: [
                NavigationButton(
                  icon: Icons.person_2,
                  label: 'Personal Data',
                ),
                NavigationButton(
                  icon: Icons.abc,
                  label: 'ABC',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/auth/view-model/auth_service.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/app_bar_title_widget.dart';
import 'package:mini_project_sem_6/widgets/feedback_icon.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/default_icon.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/navigation_button.dart';
import 'package:provider/provider.dart';

List<Map<String, String>> navigationButtonList = [
  {
    'svgIcon': 'assets/images/prediction.svg',
    'label': 'Predict Placement',
    'navigationRoute': 'prediction',
  },
  {
    'svgIcon': 'assets/images/personal_data.svg',
    'label': 'Personal Data',
    'navigationRoute': 'dashboard',
  },
  {
    'svgIcon': 'assets/images/timetable.svg',
    'label': 'Timetable',
    'navigationRoute': 'timetable',
  },
  {
    'svgIcon': 'assets/images/attendance.svg',
    'label': 'Attendance',
    'navigationRoute': 'attendance',
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.person,
          size: 80,
        ),
        title: AppBarTitleWidget(),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: DefaultIcon(
              icon: Icons.logout_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              authService.signOut();
            },
          ),
        ],
      ),
      floatingActionButton: const FeedbackIcon(),
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, -800),
            child: Transform.scale(
              scale: 3.5,
              child: Image.asset(
                'assets/images/bgCircle.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              children: navigationButtonBuilder(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> navigationButtonBuilder() {
    List<Widget> list = [];
    for (final buttonData in navigationButtonList) {
      list.add(
        NavigationButton(
          svgIcon: buttonData['svgIcon'],
          label: buttonData['label'],
          navigationRoute: buttonData['navigationRoute'].toString(),
        ),
      );
    }
    return list;
  }
}

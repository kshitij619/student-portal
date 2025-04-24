import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/attendance/view/attendance_page.dart';
import 'package:mini_project_sem_6/attendance/view_model/attendance_view_model.dart';
import 'package:provider/provider.dart';

class AttendanceProvider extends StatelessWidget {
  const AttendanceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AttendanceViewModel(),
      child: const AttendancePage(
        rollNumber: 24,
      ),
    );
  }
}

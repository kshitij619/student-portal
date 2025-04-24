import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/attendance/view_model/attendance_view_model.dart';

class AttendancePage extends StatelessWidget {
  final int rollNumber;

  const AttendancePage({super.key, required this.rollNumber});

  Future<String?> _fetchImageUrl() async {
    final viewModel = AttendanceViewModel();
    final response = await viewModel.fetchAttendance(rollNumber);

    if (response != null && response.containsKey('image_url')) {
      return response['image_url'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance Image')),
      body: FutureBuilder<String?>(
        future: _fetchImageUrl(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No image available.'));
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(snapshot.data!),
                    const SizedBox(height: 16),
                    const Text('Attendance image loaded successfully'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

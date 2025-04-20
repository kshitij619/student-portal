import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/data/data.dart';

String getTodayWeekday() {
  final now = DateTime.now();
  const weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  return weekdays[now.weekday - 1];
}

class DailyTimetable extends StatelessWidget {
  const DailyTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    final String today = getTodayWeekday();
    final List<Map<String, String>>? todaySchedule = weeklyTimetable[today];

    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Timetable - $today"),
      ),
      body: todaySchedule == null
          ? Center(child: Text('No classes today!'))
          : ListView.builder(
              itemCount: todaySchedule.length,
              itemBuilder: (context, index) {
                final item = todaySchedule[index];
                final isBreak = item['subject']!.contains("Break");

                return Card(
                  color: isBreak ? Colors.grey[200] : Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Icon(
                      isBreak ? Icons.free_breakfast : Icons.class_,
                      color: isBreak ? Colors.orange : Colors.blue,
                    ),
                    title: Text(item['subject']!),
                    subtitle: Text("Time: ${item['time']}"),
                    trailing:
                        Text(item['room']!.isNotEmpty ? item['room']! : ""),
                  ),
                );
              },
            ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AttendanceViewModel extends ChangeNotifier {
  final String _baseUrl = 'https://mini06.onrender.com/generate-attendance';

  Future<Map<String, dynamic>?> fetchAttendance(int rollNumber) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'student_index': rollNumber}),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json;
      } else {
        debugPrint('Failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching attendance: $e');
      return null;
    }
  }
}

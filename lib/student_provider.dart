import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project_sem_6/dashboard/model/student_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProvider with ChangeNotifier {
  StudentDetailsModel? _student;
  bool _isLoading = false;
  String? _error;

  StudentDetailsModel? get student => _student;
  bool get isLoading => _isLoading;
  String? get error => _error;

  static const _storageKey = 'cached_student';

  Future<void> loadStudentByEmail(String email) async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    try {
      final cached = prefs.getString(_storageKey);
      if (cached != null) {
        final json = jsonDecode(cached) as Map<String, dynamic>;
        _student = StudentDetailsModel.fromJson(json);
        _error = null;
        _isLoading = false;
        notifyListeners();
        // Optionally continue to fetch fresh data in background...
      }

      // Now fetch fresh data
      final query = await FirebaseFirestore.instance
          .collection('students')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      debugPrint('Firestore returned ${query.docs.length} documents');
      if (query.docs.isEmpty) {
        _error = 'No student found';
        _student = null;
      } else {
        _student = StudentDetailsModel.fromFirestore(query.docs.first);
        _error = null;
        // Cache it
        final toSave = jsonEncode(_student!.toJson());
        await prefs.setString(_storageKey, toSave);
      }
    } catch (e) {
      _error = e.toString();
      _student = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/dashboard/model/student_details_model.dart';

class DashboardViewModel extends ChangeNotifier {
  final CollectionReference students =
      FirebaseFirestore.instance.collection('user_data');

  Future<StudentDetailsModel?> fetchUserByEmail(String email) async {
    try {
      final query = await FirebaseFirestore.instance
          .collection('user_data')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (query.docs.isEmpty) {
        log('No user found with email $email');
        return null;
      }

      final doc = query.docs.first;
      return StudentDetailsModel.fromFirestore(doc);
    } catch (e) {
      log('Error fetching by email: $e');
      return null;
    }
  }
}

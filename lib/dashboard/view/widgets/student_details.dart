import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/dashboard/model/gender.dart';
import 'package:mini_project_sem_6/dashboard/model/student_details_model.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({super.key});

  final student = {
    'name': 'Kshitij Vyas',
    'id': 223063101,
    'email': 'kshitij.223063101@vcet.edu.in',
    'phone': 8591224915,
    'address': 'Mumbai',
    'gender': Gender.male,
    'image': 'assets/images/student_profile_demo.jpg',
    'department': 'Computer Engineering',
    'dob': '19/06/2004',
  };

  @override
  Widget build(BuildContext context) {
    final profile = StudentDetailsModel.fromMap(student);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 150,
                    backgroundImage: AssetImage(
                      profile.image,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                  width: 8,
                ),
                Center(
                  child: Text(
                    profile.name,
                    textAlign: TextAlign.end,
                    softWrap: true,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Email: ${profile.email}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Id: ${student['id']}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Phone: ${profile.phone}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Address: ${profile.address}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Gender: ${profile.gender.name}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

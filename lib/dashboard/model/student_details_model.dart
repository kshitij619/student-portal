import 'package:mini_project_sem_6/dashboard/model/gender.dart';

class StudentDetailsModel {
  StudentDetailsModel({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.address,
    required this.gender,
    required this.image,
    required this.dob,
    required this.department,
  });

  final String name;
  final int id;
  final String email;
  final int phone;
  final String address;
  final Gender gender;
  final String image;
  final String department;
  final String dob;

  factory StudentDetailsModel.fromMap(Map<String, dynamic> map) {
    return StudentDetailsModel(
      name: map['name'] as String,
      id: map['id'] as int,
      email: map['email'] as String,
      phone: map['phone'] as int,
      address: map['address'] as String,
      gender: map['gender'] as Gender,
      image: map['image'] as String,
      dob: map['dob'] as String,
      department: map['department'] as String,
    );
  }
}

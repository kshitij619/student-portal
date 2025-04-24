import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project_sem_6/dashboard/model/gender.dart';

class StudentDetailsModel {
  StudentDetailsModel({
    required this.name,
    required this.rollNumber,
    required this.email,
    required this.phone,
    required this.address,
    required this.gender,
    required this.image,
    required this.department,
  });

  final String name;
  final int rollNumber;
  final String email;
  final int phone;
  final String address;
  final Gender gender;
  final String image;
  final String department;

  factory StudentDetailsModel.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;

    final String genderString = map['gender'] as String;
    final Gender genderEnum =
        genderString == 'male' ? Gender.male : Gender.female;
    return StudentDetailsModel(
      name: map['name'] as String,
      rollNumber: map['roll_number'] as int,
      email: map['email'] as String,
      phone: map['phone'] as int,
      address: map['address'] as String,
      gender: genderEnum,
      image: 'assets/images/profile.png',
      department: map['department'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'roll_number': rollNumber,
        'email': email,
        'phone': phone,
        'address': address,
        'gender': gender.index,
        'image': image,
        'department': department,
      };

  factory StudentDetailsModel.fromJson(Map<String, dynamic> json) {
    return StudentDetailsModel(
      name: json['name'] as String,
      rollNumber: json['roll_number'] as int,
      email: json['email'] as String,
      phone: json['phone'] as int,
      address: json['address'] as String,
      gender: Gender.values[json['gender'] as int],
      image: json['image'] as String,
      department: json['department'] as String,
    );
  }

  factory StudentDetailsModel.fromMap(Map<String, dynamic> map) {
    return StudentDetailsModel(
      name: map['name'] as String,
      rollNumber: map['id'] as int,
      email: map['email'] as String,
      phone: map['phone'] as int,
      address: map['address'] as String,
      gender: map['gender'] as Gender,
      image: map['image'] as String,
      department: map['department'] as String,
    );
  }
}

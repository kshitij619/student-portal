import 'package:flutter/cupertino.dart';
import 'package:mini_project_sem_6/application.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Application());
}

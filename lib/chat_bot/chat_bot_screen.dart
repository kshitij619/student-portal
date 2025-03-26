import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/auth/view-model/auth_service.dart';
import 'package:mini_project_sem_6/dashboard/view/widgets/app_bar_title_widget.dart';
import 'package:provider/provider.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.person,
          size: 80,
        ),
        title: AppBarTitleWidget(),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

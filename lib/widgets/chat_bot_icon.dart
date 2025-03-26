import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/chat_bot/chat_bot_screen.dart';

class ChatBotIcon extends StatelessWidget {
  const ChatBotIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 195, 236, 255),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ChatBotScreen(),
          ),
        );
      },
      child: Icon(
        Icons.chat_bubble,
        color: Colors.black,
      ),
    );
  }
}

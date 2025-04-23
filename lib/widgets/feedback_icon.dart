import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/feedback/feedback_screen.dart';

class FeedbackIcon extends StatelessWidget {
  const FeedbackIcon({
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
            builder: (context) => FeedbackScreen(),
          ),
        );
      },
      child: Icon(
        Icons.feedback,
        color: Colors.black,
      ),
    );
  }
}

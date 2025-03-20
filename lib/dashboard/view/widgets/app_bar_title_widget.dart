import 'package:flutter/material.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Student Full Name',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            '223063101',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

final ButtonStyle navigationButtonStyle = ElevatedButton.styleFrom(
  minimumSize: Size(100, 100),
  elevation: 1,
  iconColor: Colors.black,
  foregroundColor: Colors.black,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: navigationButtonStyle,
      onPressed: () {},
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 120,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

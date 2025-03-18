import 'package:flutter/material.dart';

class DefaultIcon extends StatelessWidget {
  const DefaultIcon({
    super.key,
    required this.icon,
    this.color,
    this.size,
  });

  final IconData icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? 32,
      color: color ?? Theme.of(context).colorScheme.onPrimary,
    );
  }
}

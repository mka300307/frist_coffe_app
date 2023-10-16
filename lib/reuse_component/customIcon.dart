import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  CustomIcon({
    required this.icon,
    required this.size,
    required this.color
});

  @override
  Widget build(BuildContext context) {
    return Icon(
    icon,
    size: size,
    color: color,
    );
  }
}

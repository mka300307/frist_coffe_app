import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final double lebar;
  final double tinggi;
  final Color color;
  final double ronded;
  final String? img;
  final Widget? child;

  CustomBox({
    required this.lebar,
    required this.tinggi,
    required this.color,
    required this.ronded,
    this.img,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: lebar,
      height: tinggi,
      foregroundDecoration:BoxDecoration(

          color: color, borderRadius: BorderRadius.all(Radius.circular(ronded))),
      child: child,
    );
  }
}

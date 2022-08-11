import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final Color color;

  const CustomIcon(
    IconData helpCircleOutline, {
    Key? key,
    this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}

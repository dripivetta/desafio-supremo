import 'package:flutter/material.dart';

class IndicarText extends StatelessWidget {
  final Color colorText;
  final FontWeight fontWeightText;
  final double fontSizeText;
  final String text;

  const IndicarText({
    Key? key,
    required this.colorText,
    required this.fontWeightText,
    required this.fontSizeText,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSizeText,
          fontWeight: fontWeightText,
          color: colorText,
        ),
      ),
    );
  }
}

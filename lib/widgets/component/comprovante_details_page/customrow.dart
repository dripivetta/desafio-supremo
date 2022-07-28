import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String cabecalho;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomRow({Key? key, required this.cabecalho, required this.fontSize, required this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          cabecalho,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}

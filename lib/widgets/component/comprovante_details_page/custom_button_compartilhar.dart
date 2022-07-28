import 'package:flutter/material.dart';

class CustomButtonCompartilhar extends StatelessWidget {
  final String titulo;
  final double fontSize;

  const CustomButtonCompartilhar({Key? key, required this.titulo, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(500, 50),
        ),
      ),
      child: Text(
        titulo,
        style: TextStyle(
        fontSize: fontSize,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

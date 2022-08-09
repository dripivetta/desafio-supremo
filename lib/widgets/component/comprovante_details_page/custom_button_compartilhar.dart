import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonCompartilhar extends StatelessWidget {
  final String titulo;
  final double fontSize;

  const CustomButtonCompartilhar({Key? key, required this.titulo, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(18)),
          backgroundColor: MaterialStateProperty.all<Color>(BaseColors().getGreenColor()),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder()),
        ),
        child: Text(
          titulo,
          style: TextStyle(
          color: BaseColors().getWhiteColor(),
          fontSize: fontSize,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

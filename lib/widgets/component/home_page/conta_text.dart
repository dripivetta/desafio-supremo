import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContaText extends StatelessWidget {
  final String text;
  final MainAxisAlignment mainAxisRow;
  final double fontSizeText;
  final Color colorText;

  const ContaText({
    Key? key,
    required this.mainAxisRow,
    required this.text,
    required this.fontSizeText,
    required this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisRow,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSizeText,
            color: colorText,
          ),
        ),
        Icon(MdiIcons.chevronRight),
      ],
    );
  }
}

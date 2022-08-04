import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isPasswordType;
  final TextEditingController controller;
  final Color cursorColor;
  final Color textStyleColor;
  final Color colorIcon;
  final bool filled;
  final Color fillColor;
  final Color labelTextStyleColor;
  final FloatingLabelBehavior floatingLabelBehavior;
  final BorderRadius outlineBorderRadius;
  final double widthBorderSide;
  final BorderStyle borderStyle;

  // ignore: use_key_in_widget_constructors
  const CustomTextField({
    Key? key,
    required this.text,
    required this.icon,
    required this.isPasswordType,
    required this.controller,
    required this.cursorColor,
    required this.textStyleColor,
    required this.colorIcon,
    required this.filled,
    required this.fillColor,
    required this.labelTextStyleColor,
    required this.floatingLabelBehavior,
    required this.outlineBorderRadius,
    required this.widthBorderSide,
    required this.borderStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: cursorColor,
      style: TextStyle(
        color: textStyleColor,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: colorIcon,
        ),
        labelText: text,
        labelStyle: TextStyle(
          color: labelTextStyleColor,
        ),
        filled: filled,
        floatingLabelBehavior: floatingLabelBehavior,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: outlineBorderRadius,
          borderSide: BorderSide(
            width: widthBorderSide,
            style: borderStyle,
          ),
        ),
      ),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}

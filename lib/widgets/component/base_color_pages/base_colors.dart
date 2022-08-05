import 'package:flutter/material.dart';

class BaseColors {
  final Color _activeWhiteColor = Color(0xFFF8F8F8);
  final Color _activeGreyColor = Color(0xFF828282);
  final Color _activeBlackColor = Color(0XFF202021);
  final Color _activeGreenColor = Color(0XFF00C1AF);

  Color getWhiteColor() {
    return _activeWhiteColor;
  }

  Color getGreyColor() {
    return _activeGreyColor;
  }

  Color getBlackColor() {
    return _activeBlackColor;
  }

  Color getGreenColor() {
    return _activeGreenColor;
  }
}
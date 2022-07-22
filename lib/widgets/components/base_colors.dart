import 'package:flutter/material.dart';

class BaseColors{
  Color _activeWhiteColor = Color(0xFFF8F8F8);
  Color _activeGreyColor = Color(0xFF828282);
  Color _activeBlackColor = Color(0XFF202021);
  Color _activeGreenColor = Color(0XFF00C1AF);

  Color getWhiteColor (){
    return _activeWhiteColor;
  }

  
  Color getGreyColor (){
    return _activeGreyColor;
  }

  
  Color getBlackColor (){
    return _activeBlackColor;
  }

  
  Color getGreenColor (){
    return _activeGreenColor;
  }

}
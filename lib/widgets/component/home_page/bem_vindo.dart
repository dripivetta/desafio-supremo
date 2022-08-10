import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Puxar nome do usuário logado
bemVindo(User user) {
  return Container(
    margin: const EdgeInsets.only(
      left: 20,
      bottom: 20,
    ),
    child: Text(
      'Olá, ${user.email}',
      style: TextStyle(
      color: BaseColors().getWhiteColor(),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
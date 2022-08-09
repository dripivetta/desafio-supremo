import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';

// Puxar nome do usuário logado
bemVindo() {
  return Container(
    margin: const EdgeInsets.only(
      left: 20,
      bottom: 20,
    ),
    child: Text(
      'Olá, Andressa!',
      style: TextStyle(
      color: BaseColors().getWhiteColor(),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

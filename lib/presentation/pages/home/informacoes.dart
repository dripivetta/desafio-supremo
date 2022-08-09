import 'package:desafio/presentation/pages/home/emprestimo.dart';
import 'package:desafio/presentation/pages/home/seguro_vida.dart';
import 'package:flutter/material.dart';

informacoes() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          seguroVida(), 
          emprestimo(),
        ],
      ),
    ),
  );
}

import 'package:desafio/widgets/component/home_page/indicar_amigos.dart';
import 'package:desafio/widgets/component/home_page/seguro_celular.dart';
import 'package:flutter/material.dart';

descubraText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        'Descubra mais',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
    ],
  );
}

descubraMais() {
  return Column(
    children: [
      descubraText(),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              indicarAmigosArea(),
              seguroCelArea(),
            ],
          ),
        ),
      ),
    ],
  );
}
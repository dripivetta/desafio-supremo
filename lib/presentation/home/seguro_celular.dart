import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';

seguroCelArea() {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 10, bottom: 20, right: 20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: BaseColors().getGreyLigthColor(),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seguroCelText(),
        seguroCelInfo(),
        seguroCelButton(),
      ],
    ),
  );
}

seguroCelText() {
  return Center(
    child: Text(
      'Seguro para Celular',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: BaseColors().getBlackColor(),
      ),
    ),
  );
}

seguroCelInfo() {
  return Center(
    child: Text(
      'Que tal fazer um seguro contra furto \n para o seu celular?',
      style: TextStyle(
        fontSize: 16,
        color: BaseColors().getGreyColor(),
      ),
    ),
  );
}

seguroCelButton() {
  return Container(
    margin: const EdgeInsets.only(top: 15, left: 12),
    child: ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(BaseColors().getGreenColor()),
        shape: MaterialStateProperty.all(RoundedRectangleBorder()),
      ),
      child: Text(
        'Conhecer seguro',
        style: TextStyle(
          fontSize: 16,
          color: BaseColors().getWhiteColor(),
        ),
      ),
      onPressed: () {},
    ),
  );
}

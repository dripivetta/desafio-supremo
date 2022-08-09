import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';

indicarAmigosArea() {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: BaseColors().getGreyLigthColor(),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        indicarText(),
        indicarInfo(),
        indicarButton(),
      ],
    ),
  );
}

indicarText() {
  return Center(
    child: Text(
      'Indique seus amigos',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: BaseColors().getBlackColor(),
      ),
    ),
  );
}

indicarInfo() {
  return Center(
    child: Text(
      'Mostre aos seus amigos como é fácil \n ter uma vida sem burocracia.',
      style: TextStyle(
        fontSize: 16,
        color: BaseColors().getGreyColor(),
      ),
    ),
  );
}

indicarButton() {
  return Container(
    margin: const EdgeInsets.only(top: 15, left: 15),
    child: ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(BaseColors().getGreenColor()),
        shape: MaterialStateProperty.all(RoundedRectangleBorder()),
      ),
      child: Text(
        'Indicar amigos',
        style: TextStyle(
          fontSize: 16,
          color: BaseColors().getWhiteColor(),
        ),
      ),
      onPressed: () {},
    ),
  );
}

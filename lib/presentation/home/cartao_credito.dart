import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

meusCartoes() {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: BaseColors().getGreyLigthColor(),
      // borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Icon(Icons.credit_card),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Meus cartões',
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
              color: BaseColors().getBlackColor(),
            ),
          ),
        )
      ],
    ),
  );
}

cartaoCreditoArea() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cartaoCreditoText(),
        faturaText(),
        faturaInfo(),
        limiteText(),
      ],
    ),
  );
}

cartaoCreditoText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Icon(Icons.credit_card),
      Text(
        'Cartão de crédito',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      //
      Icon(Icons.keyboard_arrow_right),
    ],
  );
}

faturaText() {
  return Center(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Fatura atual',
        style: TextStyle(
          fontSize: 18,
          color: BaseColors().getGreyColor(),
        ),
      ),
    ),
  );
}

faturaInfo() {
  return Center(
    child: Text(
      'R\$ 500,00',
      style: TextStyle(
        color: BaseColors().getBlackColor(),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

limiteText() {
  return Center(
    child: Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Limite disponível de  ',
            style: TextStyle(
              color: BaseColors().getGreyColor(),
              fontSize: 16,
            ),
          ),
          Text(
            'R\$ 2.500,00',
            style: TextStyle(
              color: BaseColors().getGreenColor(),
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}

parcelarButton() {
  return Container(
    margin: const EdgeInsets.only(top: 15, left: 130),
    child: ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
        backgroundColor:
            MaterialStateProperty.all(BaseColors().getGreenColor()),
        shape: MaterialStateProperty.all(RoundedRectangleBorder()),
      ),
      child: Text(
        'Parcelar compras',
        style: TextStyle(
          fontSize: 16,
          color: BaseColors().getWhiteColor(),
        ),
      ),
      onPressed: () {},
    ),
  );
}

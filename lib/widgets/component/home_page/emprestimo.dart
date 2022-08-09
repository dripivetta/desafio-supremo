import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

emprestimo() {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: BaseColors().getGreyLigthColor(),
    ),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Você tem R\$ 150.000,00 \n disponíveis para ',
            style: TextStyle(
              fontSize: 15,
              color: BaseColors().getBlackColor(),
            ),
          ),
          TextSpan(
            text: 'empréstimo.',
            style: TextStyle(
              fontSize: 15,
              color: BaseColors().getGreenColor(),
            ),
          ),
        ],
      ),
    ),
  );
}

emprestimoArea() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        emprestimoText(),
        emprestimoInfo(),
        emprestimoButton(),
      ],
    ),
  );
}

emprestimoText() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(MdiIcons.cash),
        Text(
          'Empréstimo',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: BaseColors().getBlackColor(),
          ),
        ),
        Icon(Icons.keyboard_arrow_right),
      ],
    ),
  );
}

emprestimoInfo() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Valor disponível até  ',
            style: TextStyle(
              fontSize: 16,
              color: BaseColors().getGreyColor(),
            ),
          ),
          Text(
            'R\$ 150.000,00',
            style: TextStyle(
              fontSize: 18,
              color: BaseColors().getGreenColor(),
            ),
          ),
        ],
      ),
    ),
  );
}

emprestimoButton() {
  return Container(
    margin: const EdgeInsets.only(top: 15, left: 100),
    child: ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
        backgroundColor:
            MaterialStateProperty.all(BaseColors().getGreenColor()),
        shape: MaterialStateProperty.all(RoundedRectangleBorder()),
      ),
      child: Text(
        'Simular empréstimo',
        style: TextStyle(
          fontSize: 16,
          color: BaseColors().getWhiteColor(),
        ),
      ),
      onPressed: () {},
    ),
  );
}
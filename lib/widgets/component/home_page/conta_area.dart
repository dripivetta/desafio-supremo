import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/home_page/conta_saldo.dart';
import 'package:desafio/widgets/component/home_page/conta_text.dart';
import 'package:flutter/material.dart';

class ContaArea extends StatelessWidget {
  const ContaArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContaText(
            mainAxisRow: MainAxisAlignment.spaceBetween,
            text: 'Conta',
            fontSizeText: 20,
            colorText: BaseColors().getBlackColor(),
          ),
          ContaSaldo(
            marginContainer: EdgeInsets.only(top: 10),
            mainAxixRow: MainAxisAlignment.spaceBetween,
            text: 'R\$ 1.000,00',
            fontSizeText: 20,
            fontWeightText: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

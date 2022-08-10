import 'package:desafio/presentation/pages/extrato/extrato_page.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

conta(BuildContext context) {
  return Container(
    decoration: BoxDecoration(color: BaseColors().getWhiteColor()),
    margin: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contaTexto(context),
        saldo(),
      ],
    ),
  );
}

contaTexto(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Conta',
        style: TextStyle(
          fontSize: 20,
          color: BaseColors().getBlackColor(),
        ),
      ),
      IconButton(
        icon: Icon(MdiIcons.chevronRight),
        color: Color.fromARGB(255, 109, 108, 108),
        iconSize: 40,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExtratoPage(),
            ),
          );
        },
      ),
    ],
  );
}

// Pegar os dados do saldo da API / página de extrato
saldo() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'R\$ 1.000,00',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}



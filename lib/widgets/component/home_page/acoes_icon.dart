import 'package:desafio/widgets/component/home_page/acao_icon.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AcoesIcon extends StatelessWidget {
  const AcoesIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          AcaoIcon(icon: Icons.pix_outlined, name: 'Área Pix', isFirst: true),
          AcaoIcon(icon: MdiIcons.barcode, name: 'Pagar'),
          AcaoIcon(icon: Icons.arrow_upward_outlined, name: 'Transferir'),
          AcaoIcon(icon: Icons.arrow_downward_outlined, name: 'Depositar'),
          AcaoIcon(icon: Icons.phone_android, name: 'Recarga'),
          AcaoIcon(icon: Icons.chat_outlined, name: 'Cobrar'),
          AcaoIcon(icon: MdiIcons.heartOutline, name: 'Doação'),
          AcaoIcon(icon: MdiIcons.finance, name: 'Investir'),
        ],
      ),
    ),
  );
  }
}
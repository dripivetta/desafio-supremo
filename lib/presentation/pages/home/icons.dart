import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

icon(icon) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Icon(
      icon,
      color: BaseColors().getWhiteColor(),
    ),
  );
}

iconsAppBar() {
  return Row(
    children: [
      // visibility para Visualizar saldo
      icon(Icons.visibility_outlined),
      // help para Ajuda com o App
      icon(MdiIcons.helpCircleOutline),
      // email para Convidar amigos
      icon(Icons.person_add_outlined),
    ],
  );
}

acoesIcons() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          acaoIcon(icon: Icons.pix_outlined, name: 'Área Pix', isFirst: true),
          acaoIcon(icon: MdiIcons.barcode, name: 'Pagar'),
          acaoIcon(icon: Icons.arrow_upward_outlined, name: 'Transferir'),
          acaoIcon(icon: Icons.arrow_downward_outlined, name: 'Depositar'),
          acaoIcon(icon: Icons.phone_android, name: 'Recarga'),
          acaoIcon(icon: Icons.chat_outlined, name: 'Cobrar'),
          acaoIcon(icon: MdiIcons.heartOutline, name: 'Doação'),
          acaoIcon(icon: MdiIcons.finance, name: 'Investir'),
        ],
      ),
    ),
  );
}

acaoIcon({required IconData icon, required String name, bool? isFirst}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2),
    padding: isFirst != null && isFirst
        ? const EdgeInsets.only(left: 20, right: 6)
        : const EdgeInsets.symmetric(horizontal: 6),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: BaseColors().getGreyLigthColor(),
          ),
          child: Icon(icon),
        ),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        )
      ],
    ),
  );
}

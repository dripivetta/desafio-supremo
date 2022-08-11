import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/home_page/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IconsAppBar extends StatelessWidget {
  const IconsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // visibility para Visualizar saldo
        CustomIcon(
          icon: Icons.visibility_outlined,
          color: BaseColors().getWhiteColor(),
        ),
        // help para Ajuda com o App
        CustomIcon(
          icon: MdiIcons.helpCircleOutline,
          color: BaseColors().getWhiteColor(),
        ),
        // email para Convidar amigos
        CustomIcon(
          icon: Icons.person_add_outlined,
          color: BaseColors().getWhiteColor(),
        ),
      ],
    );
  }
}


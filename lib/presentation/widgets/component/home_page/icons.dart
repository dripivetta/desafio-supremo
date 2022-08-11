import 'package:desafio/presentation/pages/extrato/extrato_page.dart';
import 'package:desafio/presentation/pages/help/help_page.dart';
import 'package:desafio/presentation/pages/my_app.dart';
import 'package:desafio/presentation/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/presentation/widgets/component/home_page/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IconsAppBar extends StatelessWidget {
  bool _showSaldo = false;

   IconsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // visibility para Visualizar saldo
        // CustomIcon(
        //   icon: Icons.visibility_off,
        //   color: BaseColors().getWhiteColor(),
        //   //widget: ExtratoPage(),
        //   context: context,
        //   logout: false, showSaldo: _showSaldo, eye: true,
        // ),
        // help para Ajuda com o App
        CustomIcon(
          icon: MdiIcons.helpCircleOutline,
          color: BaseColors().getWhiteColor(),
          widget: HelpPage(),
          context: context,
          logout: false, eye: false, showSaldo: false,
        ),
        // email para Convidar amigos
        CustomIcon(
          icon: Icons.logout_sharp,
          color: BaseColors().getWhiteColor(),
          context: context,
          widget: MyApp(),
          logout: true, eye: false, showSaldo: false,
        ),
      ],
    );
  }
}

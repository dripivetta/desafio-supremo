import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/home_page/bem_vindo.dart';
import 'package:desafio/widgets/component/home_page/icons.dart';
import 'package:desafio/widgets/component/home_page/perfil_usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

appBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(0),
    child: AppBar(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
}

header(BuildContext context,User user) {
  return Container(
    color: BaseColors().getGreenColor(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            perfil(),
            iconsAppBar(context),
          ],
        ),
        bemVindo(user ),
      ],
    ),
  );
}

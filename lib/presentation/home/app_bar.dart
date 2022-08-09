import 'package:desafio/presentation/home/bem_vindo.dart';
import 'package:desafio/presentation/home/icons.dart';
import 'package:desafio/presentation/home/perfil_usuario.dart';
import 'package:desafio/widgets/component/base_colors.dart';
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



header() {
  return Container(
    color: BaseColors().getGreenColor(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            perfil(),
            iconsAppBar(),
          ],
        ),
        bemVindo(),
      ],
    ),
  );
}

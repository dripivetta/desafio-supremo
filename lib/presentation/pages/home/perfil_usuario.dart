import 'package:desafio/presentation/pages/home/investimento.dart';
import 'package:desafio/presentation/pages/home/seguro_celular.dart';
import 'package:desafio/presentation/pages/home/seguro_vida.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

perfil() {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: BaseColors().getGreenLigthColor(),
      ),
      child: Icon(
        MdiIcons.accountOutline,
        color: BaseColors().getWhiteColor(),
      ),
    ),
    onTap: () {
      Navigator.pop;
    },
  );
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BaseColors().getWhiteColor(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              investimentoArea(),
              seguroVidaArea(),
              seguroCelArea(),
            ],
          ),
        ),
      ),
    );
  }
}



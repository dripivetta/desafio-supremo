import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/home_page/investimento.dart';
import 'package:desafio/widgets/component/home_page/seguro_celular.dart';
import 'package:desafio/widgets/component/home_page/seguro_vida.dart';
import 'package:flutter/material.dart';

class PlanejamentosPage extends StatelessWidget {
  const PlanejamentosPage({Key? key}) : super(key: key);

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
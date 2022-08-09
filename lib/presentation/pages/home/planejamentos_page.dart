
import 'package:desafio/presentation/pages/home/investimento.dart';
import 'package:desafio/presentation/pages/home/seguro_celular.dart';
import 'package:desafio/presentation/pages/home/seguro_vida.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
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

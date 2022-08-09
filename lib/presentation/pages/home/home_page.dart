import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/home_page/app_bar.dart';
import 'package:desafio/widgets/component/home_page/cartao_credito.dart';
import 'package:desafio/widgets/component/home_page/conta.dart';
import 'package:desafio/widgets/component/home_page/descubra_mais.dart';
import 'package:desafio/widgets/component/home_page/emprestimo.dart';
import 'package:desafio/widgets/component/home_page/icons.dart';
import 'package:desafio/widgets/component/home_page/informacoes.dart';
import 'package:desafio/widgets/component/home_page/investimento.dart';
import 'package:desafio/widgets/component/home_page/seguro_vida.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    _setStatusbarColor();
    super.initState();
  }

  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(BaseColors().getGreenColor());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  body() {
    return Container(
      color: BaseColors().getWhiteColor(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              conta(),
              acoesIcons(),
              meusCartoes(),
              informacoes(),
              divider(),
              cartaoCreditoArea(),
              parcelarButton(),
              divider(),
              emprestimoArea(),
              divider(),
              investimentoArea(),
              divider(),
              seguroVidaArea(),
              divider(),
              descubraMais(),
            ],
          ),
        ),
      ),
    );
  }
}

divider() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: const Divider(
      thickness: 1,
    ),
  );
}
<<<<<<< HEAD
import 'package:desafio/presentation/pages/onboarding/bloc_onboarding.dart';
=======
>>>>>>> 43913adc1a7631c8387058a20a659b0faaa8c0c6
import 'package:desafio/presentation/pages/home/home_page.dart';
import 'package:desafio/widgets/component/onboarding_page/custom_buttom_continue.dart';
import 'package:desafio/widgets/component/onboarding_page/custom_link_pular_instrucao.dart';
import 'package:desafio/widgets/component/onboarding_page/custom_paginator.dart';
import 'package:desafio/widgets/component/onboarding_page/custom_slider.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController _controller = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                BaseColors().getGreenColor(),
                BaseColors().getWhiteColor(),
              ],
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  physics: ClampingScrollPhysics(),
                  children: [
                    CustomSlider(
                      image: 'assets/img/onboarding/cell.png',
                      title: 'Na palma da mão',
                      text:
                          'Tudo o que você precisa na palma da mão, de qualquer lugar, simples assim.',
                      widthImage: 300,
                      heightImage: 250,
                      fontSizeTitle: 24,
                      fontWeightTitle: FontWeight.w500,
                      colorTitle: BaseColors().getBlackColor(),
                      textAlignTitle: TextAlign.center,
                      fontSizeText: 18,
                      colorText: BaseColors().getBlackColor(),
                      textAlignText: TextAlign.center,
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    ),
                    CustomSlider(
                      image: 'assets/img/onboarding/moca.png',
                      title: 'Controle',
                      text:
                          'Seu saldo, transferências e pagamentos, tudo em um só lugar.',
                      widthImage: 300,
                      heightImage: 250,
                      fontSizeTitle: 24,
                      fontWeightTitle: FontWeight.w500,
                      colorTitle: BaseColors().getBlackColor(),
                      textAlignTitle: TextAlign.center,
                      fontSizeText: 18,
                      colorText: BaseColors().getBlackColor(),
                      textAlignText: TextAlign.center,
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    ),
                    CustomSlider(
                      image: 'assets/img/onboarding/cellmoca.png',
                      title: 'Compartilhe',
                      text:
                          'Aqui é fácil e rápido, compartilhe seus comprovantes com apenas um clique.',
                      widthImage: 300,
                      heightImage: 250,
                      fontSizeTitle: 24,
                      fontWeightTitle: FontWeight.w500,
                      colorTitle: BaseColors().getBlackColor(),
                      textAlignTitle: TextAlign.center,
                      fontSizeText: 18,
                      colorText: BaseColors().getBlackColor(),
                      textAlignText: TextAlign.center,
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    ),
                  ],
                ),
                CustomPaginator(
                  page: _currentPage,
                  shape: BoxShape.circle,
                  coloridx: BaseColors().getGreenColor(),
                  colornotidx: BaseColors().getGreyColor(),
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.all(4),
                  listgenerate: 3,
                  mainAxisAlignmentColumn: MainAxisAlignment.end,
                  padding: const EdgeInsets.only(bottom: 165),
                  mainAxisAlignmentRow: MainAxisAlignment.center,
                ),
                CustomBottomContinue(
                  text: _currentPage == 2 ? 'QUERO ENTRAR' : 'CONTINUAR',
                  goToInicialPage:
                      _currentPage == 2 ? goToInicialPage : proximoCard,
                  fontSize: 18,
                  color: BaseColors().getWhiteColor(),
                  paddingText:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)),
                  border: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  background: MaterialStateProperty.all<Color>(
                    BaseColors().getGreenColor(),
                  ),
                  width: 300,
                  height: 60,
                  paddingButtom: const EdgeInsets.only(bottom: 85),
                  mainAxisAlignmentColumn: MainAxisAlignment.end,
                ),
                CustomLinkPularInstrucoes(
                  text: 'Pular instruções',
                  goToInicialPage: goToInicialPage,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: BaseColors().getBlackColor(),
                  padding: const EdgeInsets.only(bottom: 40),
                  mainAxisAlignmentColumn: MainAxisAlignment.end,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToInicialPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  proximoCard() {
    _controller.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}

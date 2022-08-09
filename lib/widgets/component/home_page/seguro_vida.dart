import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

seguroVida() {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 10),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: BaseColors().getGreyLigthColor(),
      // borderRadius: BorderRadius.circular(15),
    ),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Seguro de vida a partir de \n R\$4,99/mês?  ',
            style: TextStyle(
              fontSize: 15,
              color: BaseColors().getBlackColor(),
            ),
          ),
          TextSpan(
            text: 'Conheça...',
            style: TextStyle(
              fontSize: 15,
              color: BaseColors().getGreenColor(),
            ),
          ),
        ],
      ),
    ),
  );
}

seguroVidaArea() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // seguroVidaIcon(),
        seguroVidaText(),
        seguroVidaInfo(),
      ],
    ),
  );
}

seguroVidaText() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(MdiIcons.heartOutline),
        Text(
          'Seguro de vida',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: BaseColors().getBlackColor(),
            ),  
          ),
        Icon(Icons.keyboard_arrow_right),
      ],
    ),
  );
}

seguroVidaInfo() {
  return Center(
    child: Text(
      'Conheça nosso Seguro de Vida: \n simples e cabe no seu bolso.',
      style: TextStyle(
          fontSize: 16,
          color: BaseColors().getGreyColor(),
        ),
    ),
  );
}

seguroVidaButton() {
  return Container(
    margin: const EdgeInsets.only(top: 15, left: 120),
    child: ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(BaseColors().getGreenColor()),
        shape: MaterialStateProperty.all(RoundedRectangleBorder()),
      ),
      child: Text(
        'Contratar seguro',
        style: TextStyle(
          fontSize: 16,
          color: BaseColors().getWhiteColor(),
        ),
      ),
      onPressed: () {},
    ),
  );
}
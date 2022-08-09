import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

investimentoArea() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        investimentoText(),
        investimentoInfo(),
        // investimentoButton(),
      ],
    ),
  );
}

investimentoText() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(MdiIcons.finance),
        Text(
          'Investimento Fácil',
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

investimentoInfo() {
  return Center(
    child: Text(
      'Conheça o Investimento Fácil! \n Sem taxas e sem burocracia! ',
      style: TextStyle(
        fontSize: 16,
        color: BaseColors().getGreyColor(),
      ),
    ),
  );
}

// investimentoButton() {
//   return Container(
//     margin: const EdgeInsets.only(top: 15, left: 120),
//     child: ElevatedButton(
//       style: ButtonStyle(
//         padding: MaterialStateProperty.all(EdgeInsets.all(10)),
//         backgroundColor: MaterialStateProperty.all(BaseColors().getGreenColor()),
//         shape: MaterialStateProperty.all(RoundedRectangleBorder()),
//       ),
//       child: Text(
//         'Investir agora',
//         style: TextStyle(
//           fontSize: 16,
//           color: BaseColors().getWhiteColor(),
//         ),
//       ),
//       onPressed: () {},
//     ),
//   );
// }

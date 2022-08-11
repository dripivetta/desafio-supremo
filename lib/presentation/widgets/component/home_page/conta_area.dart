import 'package:desafio/presentation/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/presentation/widgets/component/extrato_page/custom_card_amount.dart';
import 'package:desafio/presentation/widgets/component/home_page/conta_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContaArea extends StatefulWidget {
  const ContaArea({Key? key}) : super(key: key);

  @override
  State<ContaArea> createState() => _ContaAreaState();
}

class _ContaAreaState extends State<ContaArea> {
  
  @override
  Widget build(BuildContext context) {
    var nfc = NumberFormat.currency(
      symbol: "R\$",
      locale: "pt_BR",
    );
    
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        //margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContaText(
              mainAxisRow: MainAxisAlignment.spaceBetween,
              text: '  Extrato',
              fontSizeText: 20,
              colorText: BaseColors().getBlackColor(),            
            ),
          AmountBlocWidget(), 
          ],
        ),
      ),
    );
  }
}

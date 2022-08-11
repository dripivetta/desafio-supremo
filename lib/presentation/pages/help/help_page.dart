import 'package:desafio/presentation/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColors().getGreenLigthColor() ,
        centerTitle: true,
        title: Text('Página de Ajuda', style: TextStyle(color: Colors.white),),
      ) ,
      body: Container(),
    );
    
  }
}
import 'package:desafio/presentation/static_page.dart';
import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: BaseColors().getWhiteColor(),
        brightness: Brightness.light,
      ),
      home: StaticPage(),
      //home: const MyHomePage(title: 'Desafio Supreme'),
    );
  }
}


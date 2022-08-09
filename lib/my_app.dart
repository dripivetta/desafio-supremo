import 'package:desafio/presentation/pages/onboarding/onboarding.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';

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
      home: Onboard(),
    );
  }
}
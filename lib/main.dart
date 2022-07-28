import 'package:desafio/presentation/pages/home_page.dart';
import 'package:desafio/widgets/component/base_colors.dart';
import 'package:desafio/widgets/component/loading_progress.dart';
import 'package:flutter/material.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
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
      home: HomePage(),
    );
  }
}

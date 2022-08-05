import 'package:desafio/presentation/pages/forgotpassword/forgotpassword.dart';
import 'package:desafio/presentation/pages/home/home_page.dart';
import 'package:desafio/presentation/pages/onboarding/onboarding.dart';
import 'package:desafio/presentation/pages/register/register.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
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
      home: Onboard(),
    );
  }
}

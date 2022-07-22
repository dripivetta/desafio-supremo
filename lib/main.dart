import 'package:desafio/presentation/pages/comprovante_details_page.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Desafio Supreme'),

      home: const ComprovanteDetailsPage(
        amount: null,
        authentication: '',
        createdAt: '',
        description: '',
        to: '',
        tTipe: '',
      ),
    );
  }
}

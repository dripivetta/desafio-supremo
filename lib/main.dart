import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount:  ,
      itemBuilder: (_, idx) =>
          const Comprovante(), // VAI PASSAR OS PARÂMETROS DA LISTA DA API PUXANDO TODOS COMPROVANTES PELO IDX
    );
  }
}

class Comprovante extends StatelessWidget {
  const Comprovante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const ComprovantePage(), // VAI PASSAR OS PARÂMETROS DO COMPROVANTE PUXANDO A API PELO ID
          ),
        );
      },
      child: const Text('teste'),
    );
  }
}

class ComprovantePage extends StatelessWidget {
  const ComprovantePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

import 'dart:core';
import 'package:flutter/material.dart';

class ComprovanteDetailsPage extends StatefulWidget {
  final String description;
  final int? amount;
  final String to;
  final String tTipe;
  final String createdAt;
  final String authentication;

  const ComprovanteDetailsPage({
    Key? key,
    required this.description,
    required this.amount,
    required this.to,
    required this.tTipe,
    required this.createdAt,
    required this.authentication,
  }) : super(key: key);

  @override
  State<ComprovanteDetailsPage> createState() => _ComprovanteDetailsPageState();
}

class _ComprovanteDetailsPageState extends State<ComprovanteDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading para inserir um ícone do lado esquerdo
        leading: IconButton(
          color: Colors.black,
          iconSize: 35,
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Comprovante',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 2),

              // Divider para criar uma linha de separação
              const Divider(
                height: 15,
                thickness: 1.2,
                color: Colors.black,
                // endIndent: 100,
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Tipo de movimentação',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 3),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'description.toString()',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Valor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 3),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'R\$ ' 'amount.toString()',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Recebedor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 3),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'to.toString()',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Instituição Bancária',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 3),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'tTipe.toString()',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Data/Hora',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'createdAt.toString()',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Autenticação',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'authentication.toString()',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(500, 50),
                  ),
                ),
                child: const Text(
                  'Compartilhar',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
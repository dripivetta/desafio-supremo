import 'dart:core';
import 'package:desafio/widgets/component/comprovante_details_page/custom_button_compartilhar.dart';
import 'package:desafio/widgets/component/comprovante_details_page/customdivider.dart';
import 'package:desafio/widgets/component/comprovante_details_page/customrow.dart';
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
              CustomRow(cabecalho: 'Comprovante', fontSize: 20, fontWeight: FontWeight.bold,),
              const SizedBox(height: 2),
              CustomDivider(), 
              const SizedBox(height: 15),
              CustomRow(cabecalho: 'Tipo de movimentação', fontSize: 18, fontWeight: FontWeight.bold,),
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
              CustomRow(cabecalho: 'Valor', fontSize: 18, fontWeight: FontWeight.bold),
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
              CustomRow(cabecalho: 'Recebedor', fontSize: 18, fontWeight: FontWeight.bold),
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
              CustomRow(cabecalho: 'Instituição Bancária', fontSize: 18, fontWeight: FontWeight.bold), 
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
              CustomRow(cabecalho: 'Data/Hora', fontSize: 18, fontWeight: FontWeight.bold),
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
              CustomRow(cabecalho: 'Autenticação', fontSize: 18, fontWeight: FontWeight.bold),
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
              CustomButtonCompartilhar(titulo: 'Compartilhar', fontSize: 18,),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

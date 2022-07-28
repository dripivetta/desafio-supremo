import 'dart:io';
import 'dart:typed_data';

import 'package:desafio/models/detail_statement_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'comprovante_details_page/custom_button_compartilhar.dart';
import 'comprovante_details_page/customdivider.dart';
import 'comprovante_details_page/customrow.dart';

class ComprovantePage extends StatelessWidget {
  ComprovantePage({Key? key, required this.value, this.controller})
      : super(key: key);

  final DetStatement value;
  final controller;

  final nfc = NumberFormat.currency(
    symbol: "R\$",
    locale: "pt_BR",
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 10),
      child: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            CustomButtonCompartilhar(
              titulo: 'Compartilhar',
              fontSize: 18,
              printScreen: () async {
               var image = await controller.captureFromWidget(buildImage());

                saveAndShare(image);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);

    await Share.shareFiles([image.path]);
  }

  Widget buildImage() => Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRow(
              cabecalho: 'Comprovante',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 2),
            CustomDivider(),
            const SizedBox(height: 15),
            CustomRow(
              cabecalho: 'Tipo de movimentação',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 3),
            CustomRow(
                cabecalho: value.description,
                fontSize: 20,
                fontWeight: FontWeight.normal),
            const SizedBox(height: 15),
            CustomRow(
                cabecalho: 'Valor', fontSize: 18, fontWeight: FontWeight.bold),
            const SizedBox(height: 3),
            CustomRow(
                cabecalho: nfc.format(value.amount),
                fontSize: 20,
                fontWeight: FontWeight.normal),
            const SizedBox(height: 15),
            CustomRow(
                cabecalho: 'Recebedor',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            const SizedBox(height: 3),
            value.to != null
                ? CustomRow(
                    cabecalho: value.to!,
                    fontSize: 20,
                    fontWeight: FontWeight.normal)
                : CustomRow(
                    cabecalho: value.from!,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
            const SizedBox(height: 15),
            CustomRow(
                cabecalho: 'Instituição Bancária',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            const SizedBox(height: 3),
            CustomRow(
                cabecalho: value.tType,
                fontSize: 20,
                fontWeight: FontWeight.normal),
            const SizedBox(height: 15),
            CustomRow(
                cabecalho: 'Data/Hora',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            const SizedBox(height: 5),
            CustomRow(
                cabecalho:
                    DateFormat('dd/MM/yyyy - hh:mm').format(value.createdAt),
                fontSize: 20,
                fontWeight: FontWeight.normal),
            const SizedBox(height: 15),
            CustomRow(
                cabecalho: 'Autenticação',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            const SizedBox(height: 5),
            CustomRow(
                cabecalho: value.authentication,
                fontSize: 20,
                fontWeight: FontWeight.normal),
            const SizedBox(height: 50),
            const SizedBox(height: 5),
          ],
        ),
      ]);
}

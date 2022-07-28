import 'dart:core';
import 'package:desafio/data/datasources/detStatements_remote_ds.dart';
import 'package:desafio/data/repositories/detStatement_repository_imp.dart';
import 'package:desafio/data/usecases/get_detail_statements.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:desafio/services/http_service_imp.dart';
import 'package:desafio/widgets/component/comprovante_details_page/custom_app_bar.dart';
import 'package:desafio/widgets/component/comprovante_details_page/custom_button_compartilhar.dart';
import 'package:desafio/widgets/component/comprovante_details_page/customdivider.dart';
import 'package:desafio/widgets/component/comprovante_details_page/customrow.dart';
import 'package:desafio/widgets/component/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComprovanteDetailsPage extends StatefulWidget {
  final String id;

  const ComprovanteDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ComprovanteDetailsPage> createState() => _ComprovanteDetailsPageState();
}

class _ComprovanteDetailsPageState extends State<ComprovanteDetailsPage> {
  //late DetStatement? detStatement;
  late Future<DetStatement> detStatement;

  final nfc = NumberFormat.currency(
    symbol: "R\$",
    locale: "pt_BR",
  );

  final GetDetStatements _detStt = GetDetStatements(
    DetStatementsRepositoryImpl(
      DetStatementsRemoteDataSourceImpl(
        httpService: HttpServiceImpl(),
      ),
    ),
  );

  @override
  void initState() {
    detStatement = _detStt.get(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetStatement?>(
        future: detStatement,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: CustomLoading());
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(56),
                child: CustomAppBar(),
              ),
              body: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 16, right: 10),
                child: SingleChildScrollView(
                  //physics: NeverScrollableScrollPhysics(),
                  child: Column(
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
                          cabecalho: snapshot.data!.description,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      const SizedBox(height: 15),
                      CustomRow(
                          cabecalho: 'Valor',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      const SizedBox(height: 3),
                      CustomRow(
                          cabecalho: nfc.format(snapshot.data!.amount),
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      const SizedBox(height: 15),
                      CustomRow(
                          cabecalho: 'Recebedor',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      const SizedBox(height: 3),
                      snapshot.data!.to != null
                          ? CustomRow(
                              cabecalho: snapshot.data!.to!,
                              fontSize: 20,
                              fontWeight: FontWeight.normal)
                          : CustomRow(
                              cabecalho: snapshot.data!.from!,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                      const SizedBox(height: 15),
                      CustomRow(
                          cabecalho: 'Instituição Bancária',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      const SizedBox(height: 3),
                      CustomRow(
                          cabecalho: snapshot.data!.tType,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      const SizedBox(height: 15),
                      CustomRow(
                          cabecalho: 'Data/Hora',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      const SizedBox(height: 5),
                      CustomRow(
                          cabecalho: DateFormat('dd/MM/yyyy - hh:mm')
                              .format(snapshot.data!.createdAt),
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      const SizedBox(height: 15),
                      CustomRow(
                          cabecalho: 'Autenticação',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      const SizedBox(height: 5),
                      CustomRow(
                          cabecalho: snapshot.data!.authentication,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      const SizedBox(height: 150),
                      CustomButtonCompartilhar(
                        titulo: 'Compartilhar',
                        fontSize: 18,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            return Container();
          }

          return Container();
        });
  }
}

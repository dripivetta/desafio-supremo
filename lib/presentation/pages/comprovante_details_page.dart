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
import 'package:screenshot/screenshot.dart';

import '../../widgets/component/comprovante.dart';

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
  final controller = ScreenshotController();
  //late DetStatement? detStatement;
  late Future<DetStatement> detStatement;

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
            return Screenshot(
              controller: controller,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(56),
                  child: CustomAppBar(),
                ),
                body: ComprovantePage(
                  value: snapshot.data!,
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

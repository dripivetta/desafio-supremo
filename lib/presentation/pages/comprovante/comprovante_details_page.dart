import 'dart:core';
import 'package:desafio/data/datasources/detStatements_remote_ds.dart';
import 'package:desafio/data/repositories/detStatement_repository_imp.dart';
import 'package:desafio/data/usecases/get_detail_statements.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:desafio/presentation/pages/comprovante/comprovante.dart';
import 'package:desafio/services/http_service_imp.dart';
import 'package:desafio/widgets/component/base_appbar_pages/custom_app_bar.dart';
import 'package:desafio/widgets/component/base_loading_pages/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class ComprovanteDetailsPage extends StatefulWidget {
  final String id;
  const ComprovanteDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ComprovanteDetailsPage> createState() => _ComprovanteDetailsPageState();
}

class _ComprovanteDetailsPageState extends State<ComprovanteDetailsPage> {
  late Future<DetStatement> detStatement;
  final controller = ScreenshotController();

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
          return Scaffold(
            body: CustomLoading(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Screenshot(
            controller: controller,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(56),
                child: CustomAppBar(navigator: () { 
                  Navigator.pop(context);
                 }, icon: const Icon(Icons.keyboard_arrow_left), iconSize: 35, colorIcon: Colors.black, elevationApp: 0, backgroundColorApp: Colors.transparent, scrolledUnderElevationApp: 0,),
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
      },
    );
  }
}

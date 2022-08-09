<<<<<<< HEAD
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/home_page/app_bar.dart';
import 'package:desafio/widgets/component/home_page/cartao_credito.dart';
import 'package:desafio/widgets/component/home_page/conta.dart';
import 'package:desafio/widgets/component/home_page/descubra_mais.dart';
import 'package:desafio/widgets/component/home_page/emprestimo.dart';
import 'package:desafio/widgets/component/home_page/icons.dart';
import 'package:desafio/widgets/component/home_page/informacoes.dart';
import 'package:desafio/widgets/component/home_page/investimento.dart';
import 'package:desafio/widgets/component/home_page/seguro_vida.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
=======
// ignore_for_file: unnecessary_const
import 'package:desafio/data/repositories/statement_repository_imp.dart';
import 'package:desafio/data/datasources/statements_remote_ds.dart';
import 'package:desafio/data/usecases/get_statements.dart';
import 'package:desafio/models/statement_model.dart';
import 'package:desafio/presentation/pages/home/statement_page.dart';
import 'package:desafio/services/http_service_imp.dart';
import 'package:desafio/widgets/component/base_loading_pages/loading_progress.dart';
import 'package:flutter/material.dart';
>>>>>>> 43913adc1a7631c8387058a20a659b0faaa8c0c6

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
<<<<<<< HEAD
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    _setStatusbarColor();
    super.initState();
  }

  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(BaseColors().getGreenColor());
=======
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _controller;
  final int _limit = 10;
  int _offset = 0;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List<Statement> statementsList = [];

  final GetStatements _statement = GetStatements(
    StatementsRepositoryImpl(
      StatementsRemoteDataSourceImpl(
        httpService: HttpServiceImpl(),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  void _firstLoad() async {
    setState(
      () {
        _isFirstLoadRunning = true;
      },
    );
    try {
      final list = (await _statement.get(_limit, _offset))!;
      setState(
        () {
          statementsList = list;
        },
      );
    } catch (err) {
      // ignore: avoid_print
      print('Something went wrong1');
    }
    setState(
      () {
        _isFirstLoadRunning = false;
      },
    );
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(
        () {
          _isLoadMoreRunning =
              true; // Display a progress indicator at the bottom
        },
      );
      _offset += 1; // Increase _page by 1

      try {
        final list = (await _statement.get(_limit, _offset))!;
        final List<Statement> lista = list;

        if (lista.isNotEmpty) {
          setState(
            () {
              statementsList.addAll(lista);
            },
          );
        } else {
          setState(
            () {
              _hasNextPage = false;
            },
          );
        }
      } catch (err) {
        // ignore: avoid_print
        print('Something went wrong2!');
      }
      setState(
        () {
          _isLoadMoreRunning = false;
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
>>>>>>> 43913adc1a7631c8387058a20a659b0faaa8c0c6
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  body() {
    return Container(
      color: BaseColors().getWhiteColor(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              conta(),
              acoesIcons(),
              meusCartoes(),
              informacoes(),
              divider(),
              cartaoCreditoArea(),
              parcelarButton(),
              divider(),
              emprestimoArea(),
              divider(),
              investimentoArea(),
              divider(),
              seguroVidaArea(),
              divider(),
              descubraMais(),
            ],
          ),
        ),
      ),
    );
  }
}

divider() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: const Divider(
      thickness: 1,
    ),
  );
}
=======
    return _isFirstLoadRunning
        ? CustomLoading()
        : StatementPage(
            isLoadMoreRunning: _isLoadMoreRunning,
            statementsList: statementsList,
            controller: _controller,
          );
  }
}
>>>>>>> 43913adc1a7631c8387058a20a659b0faaa8c0c6

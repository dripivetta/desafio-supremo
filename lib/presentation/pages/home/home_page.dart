import 'package:desafio/injection.dart';
import 'package:desafio/presentation/bloc/statement/statement_bloc.dart';
import 'package:desafio/presentation/bloc/statement/statement_event.dart';
import 'package:desafio/presentation/bloc/statement/statement_state.dart';
import 'package:desafio/presentation/pages/home/statement_page.dart';
import 'package:desafio/widgets/component/comprovante_details_page/custom_loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomePageState();
}

class _HomePageState extends State<HomeBody> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    //_statementBloc = context.read<StatementBloc>();
    _controller.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    //bloc
    return StatementPage(controller: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    double maxScroll = _controller.position.maxScrollExtent;
    double currentScroll = _controller.offset;
    if (currentScroll == maxScroll) {
      //_statementBloc.add(FetchStatement());
      getIt.get<StatementBloc>().add(FetchStatement());
    }
  }
}

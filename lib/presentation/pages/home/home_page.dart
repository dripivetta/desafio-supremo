import 'package:desafio/injection.dart';
import 'package:desafio/presentation/bloc/statement/statement_bloc.dart';
import 'package:desafio/presentation/bloc/statement/statement_event.dart';
import 'package:desafio/presentation/pages/home/statement_page.dart';

import 'package:flutter/material.dart';

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
    _controller.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
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
      getIt.get<StatementBloc>().add(FetchStatement());
    }
  }
}

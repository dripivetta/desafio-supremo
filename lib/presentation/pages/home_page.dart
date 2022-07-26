import 'dart:io';

import 'package:desafio/data/repositories/statement_repository_imp.dart';
import 'package:desafio/data/repositories/statements_remote_ds.dart';
import 'package:desafio/data/usecases/get_amount.dart';
import 'package:desafio/data/usecases/get_statements.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:desafio/models/statement_model.dart';
import 'package:desafio/widgets/statements_list_widget.dart';
import 'package:desafio/services/http_service_imp.dart';
import 'package:desafio/widgets/amount_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _offset = 0;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List<Statement> x = [];

  GetStatements _statement = GetStatements(
    StatementsRepositoryImpl(
      StatementsRemoteDataSourceImpl(
        httpService: HttpServiceImpl(),
      ),
    ),
  );

  final GetAmount _amount = GetAmount(
    StatementsRepositoryImpl(
      StatementsRemoteDataSourceImpl(
        httpService: HttpServiceImpl(),
      ),
    ),
  );

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      GetStatements _statement = GetStatements(
        StatementsRepositoryImpl(
          StatementsRemoteDataSourceImpl(
            httpService: HttpServiceImpl(),
          ),
        ),
      );
      _statement.get(_offset);
      setState(() {
        List<Statement> y = _statement.statements.value!  ;
      });
    } catch (err) {
      print('Something went wrong1');
    }

    setState(() {
      
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      print('fdogiofjgiofjdgiojdfiogjfdiojgd $x');
      _offset += 1; // Increase _page by 1
      try {
       _statement.get(_offset);
       List<Statement> y  = _statement.statements.value!;
       
        
        //print(_statement.statements.value);
        
        //print('Valor do Y =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $y'  );
        if (y.isNotEmpty) {
          setState(() {
            x.addAll(y);
            
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong2!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _statement.get(_offset);

    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  // The controller for the ListView
  //late ScrollController _controller;
  late ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Extrato',
          style: TextStyle(
            shadows: const <Shadow>[
              Shadow(
                offset: Offset(1.0, 4.0),
                blurRadius: 8.0,
                color: Color.fromARGB(255, 190, 185, 185),
              ),
            ],
          ),
        ),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: const CircularProgressIndicator(),
            )
          : Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ValueListenableBuilder<Amount?>(
              valueListenable: _amount.amount,
              builder: (__, amount, _) {
                return amount != null
                    ? AmountWidget(amount: amount) //Widget Ricardo
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
            
            Expanded(
              child: 
              ValueListenableBuilder<List<Statement>?>(
                valueListenable: _statement.statements,
                builder: (__, x, _) {
                  return x != null
                      ? StatementsListWidget(
                          statements: x,
                          controller: _controller,
                        )
                      //Widget Igor
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
            // when the _loadMore function is running
            if (_isLoadMoreRunning == true)
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),

            // When nothing else to load
            if (_hasNextPage == false)
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.amber,
                child: const Center(
                  child: Text('You have fetched all of the content'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

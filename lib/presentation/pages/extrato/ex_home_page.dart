// // ignore_for_file: unnecessary_const
// import 'package:desafio/data/repositories/statement_repository_imp.dart';
// import 'package:desafio/data/datasources/statements_remote_ds.dart';
// //import 'package:desafio/data/usecases/get_statements.dart';
// import 'package:desafio/models/statement_model.dart';
// import 'package:desafio/presentation/pages/home/statement_page.dart';
// import 'package:desafio/services/http_service_imp.dart';
// import 'package:desafio/widgets/component/comprovante_details_page/custom_loading_progress.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late ScrollController _controller;
//   final int _defautLimit = 10;
//   int _offset = 0;
//   bool _hasNextPage = true;
//   bool _isFirstLoadRunning = false;
//   bool _isLoadMoreRunning = false;
//   List<StatementModel> statementsList = [];


//   @override
//   void initState() {
//     super.initState();
//     _firstLoad();
//     _controller = ScrollController()..addListener(_loadMore);
//   }

//   void _firstLoad() async {
//     setState(
//       () {
//         _isFirstLoadRunning = true;
//       },
//     );
//     try {
//       final list = (await _statement.get(_defautLimit, _offset))!;
//       setState(
//         () {
//           statementsList = list;
//         },
//       );
//     } catch (err) {
//       // ignore: avoid_print
//       print('Something went wrong1');
//     }
//     setState(
//       () {
//         _isFirstLoadRunning = false;
//       },
//     );
//   }

//   void _loadMore() async {
//     if (_hasNextPage == true &&
//         _isFirstLoadRunning == false &&
//         _isLoadMoreRunning == false &&
//         _controller.position.extentAfter < 300) {
//       setState(
//         () {
//           _isLoadMoreRunning =
//               true; // Display a progress indicator at the bottom
//         },
//       );
//       _offset += 1; // Increase _page by 1

//       try {
//         final list = (await _statement.get(_defautLimit, _offset))!;
//         final List<StatementModel> lista = list;

//         if (lista.isNotEmpty) {
//           setState(
//             () {
//               statementsList.addAll(lista);
//             },
//           );
//         } else {
//           setState(
//             () {
//               _hasNextPage = false;
//             },
//           );
//         }
//       } catch (err) {
//         // ignore: avoid_print
//         print('Something went wrong2!');
//       }
//       setState(
//         () {
//           _isLoadMoreRunning = false;
//         },
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _controller.removeListener(_loadMore);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isFirstLoadRunning
//         ? CustomHomeLoading()
//         : StatementPage(
//             isLoadMoreRunning: _isLoadMoreRunning,
//             statementsList: statementsList,
//             controller: _controller,
//           );
//   }
// }

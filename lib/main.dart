import 'package:desafio/my_app.dart';
import 'package:flutter/material.dart';
import 'package:desafio/injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

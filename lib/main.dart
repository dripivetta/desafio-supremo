import 'package:desafio/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(); 
 runApp(MyApp());
}
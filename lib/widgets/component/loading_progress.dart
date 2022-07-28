import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatefulWidget {

  const CustomLoading({Key? key}) : super(key: key);

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {
  @override
  void initState() {
    super.initState();
   
    Future.delayed(
      const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            // ignore: prefer_const_constructors
            const SizedBox(
              height: 5.0,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(BaseColors().getGreenColor()),
              strokeWidth: 11.0,
            )
          ],
        ),
      ),
    );
  }
}
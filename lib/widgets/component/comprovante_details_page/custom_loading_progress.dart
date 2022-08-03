import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';

class CustomHomeLoading extends StatefulWidget {
  const CustomHomeLoading({Key? key}) : super(key: key);

  @override
  State<CustomHomeLoading> createState() => _CustomHomeLoadingState();
}

class _CustomHomeLoadingState extends State<CustomHomeLoading> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(BaseColors().getGreenColor()),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}

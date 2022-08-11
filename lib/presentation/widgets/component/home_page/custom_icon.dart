import 'package:desafio/presentation/widgets/component/base_color_pages/base_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final Color color;
  final BuildContext context;
  final dynamic widget;
  final bool logout;

  const CustomIcon({
    Key? key,
    this.icon,
    required this.color,
    this.widget,
    required this.context,
    required this.logout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: BaseColors().getWhiteColor(),
      ),
      onPressed: () {
        logout
            ? [
                FirebaseAuth.instance.signOut(),
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/myapp',
                  (route) => false,
                ),
              ]
            : [
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => widget,
                  ),
                )
              ];
      },
    );
  }
}

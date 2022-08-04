import 'package:desafio/widgets/component/base_appbar_pages/custom_app_bar.dart';
import 'package:desafio/widgets/component/forgotpassword/firebasebuttom.dart';
import 'package:desafio/widgets/component/forgotpassword/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          navigator: () {},
          icon: const Icon(Icons.keyboard_arrow_left),
          iconSize: 35,
          colorIcon: Colors.black,
          elevationApp: 0,
          backgroundColorApp: Colors.transparent,
          scrolledUnderElevationApp: 0,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              BaseColors().getGreenColor(),
              BaseColors().getWhiteColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  controller: _emailTextController,
                  icon: Icons.email_outlined,
                  text: 'Enter Email',
                  isPasswordType: false,
                  cursorColor: Colors.white,
                  textStyleColor: Colors.white.withOpacity(0.9),
                  colorIcon: Colors.white,
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  labelTextStyleColor: Colors.white.withOpacity(0.9),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  outlineBorderRadius: BorderRadius.circular(18),
                  widthBorderSide: 0,
                  borderStyle: BorderStyle.none,
                ),
                SizedBox(height: 16),
                firebaseButtom(
                  context,
                  'Reset Password',
                  () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(
                            email: _emailTextController.text)
                        .then((value) => Navigator.of(context).pop());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

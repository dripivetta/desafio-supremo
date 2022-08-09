import 'package:desafio/widgets/component/base_appbar_pages/custom_app_bar.dart';
import 'package:desafio/widgets/component/forgotpassword/custom_text_field.dart';
import 'package:desafio/widgets/component/forgotpassword/forgot_password_buttom.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          navigator: () {Navigator.pop(context);},
          icon: const Icon(Icons.keyboard_arrow_left),
          iconSize: 35,
          colorIcon: BaseColors().getBlackColor(),
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
            child: Form(
             
              child: Column(
              children: <Widget>[
                SizedBox(
                  height: 32,
                ),
                CustomTextField(
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    text: 'Entre com seu email',
                    isPasswordType: false,
                    cursorColor: BaseColors().getWhiteColor(),
                    textStyleColor:
                        BaseColors().getWhiteColor().withOpacity(0.9),
                    colorIcon: BaseColors().getWhiteColor(),
                    filled: true,
                    fillColor: BaseColors().getGreyColor().withOpacity(0.3),
                    labelTextStyleColor:
                        BaseColors().getWhiteColor().withOpacity(0.9),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    outlineBorderRadius: BorderRadius.circular(18),
                    widthBorderSide: 0,
                    borderStyle: BorderStyle.none,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return val != null && !EmailValidator.validate(val)
                          ? 'Insira um email válido'
                          : null;
                    }),
                SizedBox(height: 16),
                ForgotPasswordButtom(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  buttomColor: MaterialStateProperty.all(
                    BaseColors().getBlackColor().withOpacity(0.3),
                  ),
                  fontWeightText: FontWeight.bold,
                  fontSizeText: 16,
                  textColor: BaseColors().getWhiteColor(),
                  title: 'Resetar senha',
                  onTap: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _emailController.text)
                        .then((value) => Navigator.of(context).pop());
                  },
                  marginContainerButtom: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  heightContainerButtom: 50,
                )
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }

  
}

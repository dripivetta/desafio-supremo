import 'package:desafio/presentation/pages/home/home_page.dart';
import 'package:desafio/widgets/component/base_appbar_pages/custom_app_bar.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/forgotpassword/custom_text_field.dart';
import 'package:desafio/widgets/component/register_page/custom_bottom_singup.dart';
import 'package:desafio/widgets/component/register_page/custom_buttom_singin.dart';
import 'package:desafio/widgets/component/register_page/descriptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _senhaTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: CustomAppBar(
            navigator: () {},
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
            reverse: true,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.12, 20, 0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/img/splashpage/splash.png',
                    width: 150,
                    height: 150,
                  ),
                  Description(
                    text: 'Sign Up',
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10),
                  Description(
                    text: "Welcome, let's make your registration",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 45),
                  CustomTextField(
                    text: 'Email',
                    icon: Icons.email_outlined,
                    isPasswordType: false,
                    controller: _emailTextController,
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
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    text: 'Password',
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: _senhaTextController,
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
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    text: 'Confirm password',
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: _senhaTextController,
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
                  ),
                  SizedBox(height: 10),
                  CustomButtomSingUp(
                    heightContainerButtom: 48,
                    marginButtom: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    borderRadius: BorderRadius.circular(90),
                    onTap: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _senhaTextController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }).onError((error, stackTrace) {
                        // ignore: avoid_print
                        print('Error ${error.toString()}');
                      });
                    },
                    textButtom: 'Login',
                    colorTextButtom: BaseColors().getWhiteColor(),
                    fontSizeText: 16,
                    fontWeightText: FontWeight.bold,
                    backgroundColorButtom: MaterialStateProperty.all(
                      BaseColors().getBlackColor().withOpacity(0.3),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Description(
                        text: 'Joined us before?',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomButtomSingIn(
                        text: 'Sign In',
                        fontSizeText: 12,
                        fontWeightText: FontWeight.bold,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

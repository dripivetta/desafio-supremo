import 'package:desafio/presentation/bloc/auth/auth_bloc.dart';
import 'package:desafio/presentation/pages/home/home_page.dart';
import 'package:desafio/presentation/pages/onboarding/onboarding.dart';
import 'package:desafio/presentation/pages/signIn/sign_in_page.dart';
import 'package:desafio/widgets/component/base_appbar_pages/custom_app_bar.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/base_loading_pages/loading_progress.dart';
import 'package:desafio/widgets/component/forgotpassword/custom_text_field.dart';
import 'package:desafio/widgets/component/register_page/custom_bottom_singup.dart';
import 'package:desafio/widgets/component/register_page/custom_buttom_singin.dart';
import 'package:desafio/widgets/component/register_page/descriptions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: CustomAppBar(
            navigator: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left),
            iconSize: 35,
            colorIcon: BaseColors().getBlackColor(),
            elevationApp: 0,
            backgroundColorApp: Colors.transparent,
            scrolledUnderElevationApp: 0,
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is Authenticated) {
            //MENSAGEM DE OK
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Onboard(),
              ),
            );
          }

          if (state is AuthError) {
            //Display the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        }, builder: (context, state) {
          if (state is Loading) {
            //Display the custom loading indicator while user is signing up
            return const Center(
              child: CustomLoading(),
            );
          }
          if (state is UnAuthenticated) {
            //Displaying the sign up form if the user is not authenticated
            return Container(
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
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                   // reverse: true,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          10, MediaQuery.of(context).size.height * 0.2, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/img/splashpage/splash.png",
                            width: 150,
                            height: 150,
                          ),
                          Description(
                            text: 'Registre-se',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          Description(
                            text: "Bem-vindo, faça seu cadastro",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 15),
                          CustomTextField(
                            text: 'Email',
                            icon: Icons.email_outlined,
                            isPasswordType: false,
                            controller: _emailController,
                            cursorColor: BaseColors().getWhiteColor(),
                            textStyleColor:
                                BaseColors().getWhiteColor().withOpacity(0.9),
                            colorIcon: BaseColors().getWhiteColor(),
                            filled: true,
                            fillColor:
                                BaseColors().getGreyColor().withOpacity(0.3),
                            labelTextStyleColor:
                                BaseColors().getWhiteColor().withOpacity(0.9),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            outlineBorderRadius: BorderRadius.circular(10),
                            widthBorderSide: 0,
                            borderStyle: BorderStyle.none,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              return val != null &&
                                      !EmailValidator.validate(val)
                                  ? 'Insira um email válido'
                                  : null;
                            },
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            text: 'Senha',
                            icon: Icons.lock_outline,
                            isPasswordType: true,
                            controller: _passwordController,
                            cursorColor: BaseColors().getWhiteColor(),
                            textStyleColor:
                                BaseColors().getWhiteColor().withOpacity(0.9),
                            colorIcon: BaseColors().getWhiteColor(),
                            filled: true,
                            fillColor:
                                BaseColors().getGreyColor().withOpacity(0.3),
                            labelTextStyleColor:
                                BaseColors().getWhiteColor().withOpacity(0.9),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            outlineBorderRadius: BorderRadius.circular(18),
                            widthBorderSide: 0,
                            borderStyle: BorderStyle.none,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              return val != null && val.length < 6
                                  ? "A senha deve possuir pelo menos 6 caracteres"
                                  : null;
                            },
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            text: 'Confirme sua senha',
                            icon: Icons.lock_outline,
                            isPasswordType: true,
                            controller: _confirmPasswordController,
                            cursorColor: BaseColors().getWhiteColor(),
                            textStyleColor:
                                BaseColors().getWhiteColor().withOpacity(0.9),
                            colorIcon: BaseColors().getWhiteColor(),
                            filled: true,
                            fillColor:
                                BaseColors().getGreyColor().withOpacity(0.3),
                            labelTextStyleColor:
                                BaseColors().getWhiteColor().withOpacity(0.9),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            outlineBorderRadius: BorderRadius.circular(18),
                            widthBorderSide: 0,
                            borderStyle: BorderStyle.none,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (val) {
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                return 'As senhas não são coincidentes';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          CustomButtomSingUp(
                            heightContainerButtom: 60,
                            marginButtom: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            borderRadius: BorderRadius.circular(90),
                            onTap: () {
                              _createAccountWithEmailAndPassword(context);
                            },
                            textButtom: 'Cadastre-se',
                            colorTextButtom: BaseColors().getWhiteColor(),
                            fontSizeText: 16,
                            fontWeightText: FontWeight.bold,
                            backgroundColorButtom: MaterialStateProperty.all(
                              BaseColors().getBlackColor().withOpacity(0.3),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Description(
                                text: 'Já possui conta?',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomButtomSingIn(
                                text: 'Realize o login',
                                fontSizeText: 14,
                                fontWeightText: FontWeight.bold,
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }

  //method for validation the register in firebase data
  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _emailController.text,
          _passwordController.text,
        ),
      );
    }
  }
}

import 'package:desafio/bloc/bloc/auth_bloc.dart';
import 'package:desafio/widgets/component/base_colors.dart';
import 'package:desafio/widgets/component/loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:email_validator/email_validator.dart';
import '../dashboard/dashboard.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Dashboard()));
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            // Showing the loading indicator while the user is signing in
            return const Center(
              child: CustomLoading(),
            );
          }
          if (state is UnAuthenticated) {
            return SingleChildScrollView(
              reverse: true,
              child: Column(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    color: BaseColors().getGreenColor(),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/img/splash.png",
                          height: 220,
                        ),
                      ),
                      Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 60,
                                margin: EdgeInsets.only(left: 12),
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, bottom: 4),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: BaseColors().getWhiteColor(),
                                ),
                                child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.email,
                                            color: BaseColors().getGreyColor()),
                                        hintText: 'E-mail'),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (val) {
                                      return val != null &&
                                              !EmailValidator.validate(val)
                                          ? 'Enter a valid email'
                                          : null;
                                    }),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 60,
                                margin: EdgeInsets.only(top: 28, left: 12),
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, bottom: 4),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: BaseColors().getWhiteColor(),
                                ),
                                child: TextFormField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.key,
                                            color: BaseColors().getGreyColor()),
                                        hintText: 'Password'),
                                    obscureText: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (val) {
                                      return val != null && val.length < 6
                                          ? 'Enter min 6 characters'
                                          : null;
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 12),
                      child: RichText(
                        text: TextSpan(
                            text: 'Forgot your password?',
                            style: TextStyle(
                                color: BaseColors().getBlackColor(),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ),
                    )),
                SizedBox(height: 70),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  margin: EdgeInsets.only(left: 12),
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: BaseColors().getGreenColor(),
                  ),
                  child: TextButton(
                    child: Center(
                      child: Text(
                        'Login'.toUpperCase(),
                        style: TextStyle(
                            color: BaseColors().getWhiteColor(),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      _authenticateWithEmailAndPassword(
                                          context);
                    },
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Don't have an Account?",
                        style: TextStyle(
                            color: BaseColors().getBlackColor(),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    RichText(
                      text: TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              color: BaseColors().getGreenColor(),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ),
                  ],
                )
              ]),
            );
          }
          return Container();
        },
      ),
    )
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  


}
 

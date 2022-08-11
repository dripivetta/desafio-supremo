
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/widgets/component/forgotpassword_page/auxiliar/custom_text_field.dart';
import 'package:desafio/widgets/component/register_page/auxiliar/descriptions.dart';
import 'package:desafio/widgets/component/register_page/register_cadastro_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'have_account_widget.dart';

class FormRegisterWidget extends StatelessWidget {
  const FormRegisterWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) : _formKey = formKey, _emailController = emailController, _passwordController = passwordController, _confirmPasswordController = confirmPasswordController, super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
              fillColor: BaseColors().getGreyColor().withOpacity(0.3),
              labelTextStyleColor:
                  BaseColors().getWhiteColor().withOpacity(0.9),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              outlineBorderRadius: BorderRadius.circular(10),
              widthBorderSide: 0,
              borderStyle: BorderStyle.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                return val != null && !EmailValidator.validate(val)
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
              fillColor: BaseColors().getGreyColor().withOpacity(0.3),
              labelTextStyleColor:
                  BaseColors().getWhiteColor().withOpacity(0.9),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              outlineBorderRadius: BorderRadius.circular(18),
              widthBorderSide: 0,
              borderStyle: BorderStyle.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              fillColor: BaseColors().getGreyColor().withOpacity(0.3),
              labelTextStyleColor:
                  BaseColors().getWhiteColor().withOpacity(0.9),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              outlineBorderRadius: BorderRadius.circular(18),
              widthBorderSide: 0,
              borderStyle: BorderStyle.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  return 'As senhas não são coincidentes';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            CadastreRegisterWidget(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            SizedBox(height: 10),
            HaveAccountWidget(),
          ],
        ),
      )),
    );
  }
}
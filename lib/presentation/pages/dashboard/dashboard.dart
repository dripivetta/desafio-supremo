import 'package:desafio/presentation/pages/signIn/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../widgets/component/base_color_pages/base_colors.dart';
import '../../../widgets/component/register_page/custom_bottom_singup.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false,
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email: \n ${user.email}',
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
                        const SizedBox(height: 16),
              CustomButtomSingUp(
                heightContainerButtom: 60,
                marginButtom: EdgeInsets.fromLTRB(0, 8, 0, 8),
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  // Signing out the user
                  context.read<AuthBloc>().add(SignOutRequested());
                },
                textButtom: 'Logout',
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
            ],
          ),
        ),
      ),
    );
  }
}
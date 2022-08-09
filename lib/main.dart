import 'package:desafio/data/repositories/authentication/auth_repository.dart';
import 'package:desafio/presentation/pages/dashboard/dashboard.dart';
import 'package:desafio/presentation/pages/onboarding/onboarding.dart';
import 'package:desafio/presentation/pages/signIn/sign_in_page.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth/auth_bloc.dart';

Future main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(); 
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(create: (context) => AuthRepository(),
    
    child: BlocProvider(create: (context)=> AuthBloc(
      authRepository: RepositoryProvider.of<AuthRepository>(context),
      ),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: BaseColors().getWhiteColor(),
        brightness: Brightness.light,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
         builder: (context,snaphot) {
           // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
           if(snaphot.hasData){
          return const Onboard();
          }
          //Otherwise, they are not signed in. Show the sign in page.
            return LoginPage();
         } ),
    ),
      ),
    );
      }
}

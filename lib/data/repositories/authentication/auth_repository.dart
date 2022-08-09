

import 'package:firebase_auth/firebase_auth.dart';


class AuthRepository{
  final _firebaseAuth = FirebaseAuth.instance;
  

//create the Sign Up method
Future<void>signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //various exceptions to handle errors
      if (e.code == 'weak-password') {
        throw Exception('A senha é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('Esta conta já existe para este usuário.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
}
//create the Sign In method
Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('Nenhum usuário encontrado para este email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Senha errada para este usuário.');
      }
    }
}

  // create the signOut method
   Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}




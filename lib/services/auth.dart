import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future register(String email, String pwd) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future signIn(String email, String pwd) async {
    try {
      UserCredential user =
          await auth.signInWithEmailAndPassword(email: email, password: pwd);
      return user;
    } catch (e) {
      return null;
    }
  }
}

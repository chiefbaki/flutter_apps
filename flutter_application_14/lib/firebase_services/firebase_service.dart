import 'package:firebase_auth/firebase_auth.dart';

class FireBaseServices {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> createAccount(
      {required String email, required String password}) async {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}

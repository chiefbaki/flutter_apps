import 'package:firebase_auth/firebase_auth.dart';

class FireBaseServices{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> createAccount({required String email, required String password}) async{
    final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return result;
  }
}
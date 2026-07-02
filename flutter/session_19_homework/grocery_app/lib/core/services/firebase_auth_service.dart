import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/errors/custom_exception.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw CustomException.fromException(e);
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } catch (e) {
      throw CustomException.fromException(e);
    }
  }

  bool isLoggedIn() => _firebaseAuth.currentUser != null;

  String? getUid() => _firebaseAuth.currentUser?.uid;
}

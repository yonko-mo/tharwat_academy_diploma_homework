import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';

class AuthRepository {
  final FirebaseAuthService authService;
  final FirestoreService firestoreService;

  AuthRepository({
    required this.authService,
    required this.firestoreService,
  });

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      } else {
        throw e.message ?? 'Authentication failed.';
      }
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final credential = await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user != null) {
        await firestoreService.saveUserData(
          uid: user.uid,
          data: {
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'createdAt': FieldValue.serverTimestamp(),
          },
        );
      } else {
        throw 'Failed to get authenticated user details.';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        throw e.message ?? 'Registration failed.';
      }
    } catch (e) {
      throw 'Something went wrong: $e';
    }
  }

  User? get currentUser => authService.currentUser;
}

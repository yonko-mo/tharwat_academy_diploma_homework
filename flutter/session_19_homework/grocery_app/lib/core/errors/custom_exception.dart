import 'package:firebase_auth/firebase_auth.dart';

class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  factory CustomException.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return CustomException('No user found for that email.');
      case 'wrong-password':
        return CustomException('Wrong password provided for that user.');
      case 'weak-password':
        return CustomException('The password provided is too weak.');
      case 'email-already-in-use':
        return CustomException('An account already exists for that email.');
      case 'invalid-email':
        return CustomException('The email address is not valid.');
      case 'user-disabled':
        return CustomException('This account has been disabled.');
      case 'too-many-requests':
        return CustomException('Too many attempts. Please try again later.');
      case 'invalid-credential':
        return CustomException('Invalid email or password.');
      default:
        return CustomException(e.message ?? 'Authentication failed.');
    }
  }

  factory CustomException.fromFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return CustomException('Permission denied. Please check your access.');
      case 'not-found':
        return CustomException('Requested data not found.');
      case 'unavailable':
        return CustomException('Service is unavailable. Please try again later.');
      case 'deadline-exceeded':
        return CustomException('Request timed out. Please try again.');
      default:
        return CustomException(e.message ?? 'Database operation failed.');
    }
  }

  @override
  String toString() => message;
}

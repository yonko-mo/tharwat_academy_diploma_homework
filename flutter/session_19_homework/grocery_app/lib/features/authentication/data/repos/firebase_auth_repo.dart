import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/features/authentication/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Future<void> createAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    return _authService.createAccount(email: email, password: password);
  }
  // final user = credential.user;
  // if (user != null) {
  //   await _firestoreService.saveUserData(
  //     uid: user.uid,
  //     data: {'firstName': firstName, 'lastName': lastName, 'email': email},
  //   );
  // } else {
  //   throw CustomException('Failed to get authenticated user details.');
  // }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

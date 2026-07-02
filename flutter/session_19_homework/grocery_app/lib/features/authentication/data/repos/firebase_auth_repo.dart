import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';
import 'package:grocery_app/features/authentication/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Future<void> createAccount({
    required UserModel user,
    required String password,
  }) async {
    var userCredential = await _authService.createAccount(
      email: user.email,
      password: password,
    );
    await _firestoreService.addDocument(
      data: {
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
      },
      collectionPath: 'users',
      documentId: userCredential.user!.uid,
    );
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    var userCredential = await _authService.signIn(
      email: email,
      password: password,
    );
    var user = await _firestoreService.getDocument(
      collectionPath: 'users',
      documentId: userCredential.user!.uid,
    );
    return UserModel.fromJson(user!);
  }
}

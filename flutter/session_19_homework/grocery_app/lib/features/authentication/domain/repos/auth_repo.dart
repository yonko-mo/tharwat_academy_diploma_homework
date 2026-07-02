import 'package:grocery_app/features/authentication/domain/models/user_model.dart';

abstract class AuthRepo {
  Future<void> createAccount({
    required UserModel user,
    required String password,
  });
  Future<UserModel?> signIn({required String email, required String password});
}

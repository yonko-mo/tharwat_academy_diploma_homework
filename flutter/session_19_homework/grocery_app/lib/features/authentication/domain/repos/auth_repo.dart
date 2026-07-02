abstract class AuthRepo {
  Future<void> createAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
  Future<void> signIn({required String email, required String password});
}

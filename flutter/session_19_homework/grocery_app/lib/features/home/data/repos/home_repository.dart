import 'package:grocery_app/core/errors/custom_exception.dart';
import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';

class HomeRepository {
  final FirebaseAuthService _authService;
  final FirestoreService _firestoreService;

  HomeRepository({
    FirebaseAuthService? authService,
    FirestoreService? firestoreService,
  })  : _authService = authService ?? FirebaseAuthService(),
        _firestoreService = firestoreService ?? FirestoreService();

  Future<UserModel> getUserProfile() async {
    final user = _authService.currentUser;
    if (user == null) {
      throw CustomException('No user is currently logged in.');
    }

    final doc = await _firestoreService.getUserData(uid: user.uid);
    if (doc.exists) {
      final data = doc.data() ?? {};
      return UserModel.fromMap(data);
    } else {
      return const UserModel(firstName: '', lastName: '', email: '');
    }
  }
}

import 'package:grocery_app/core/services/firebase_auth_service.dart';
import 'package:grocery_app/core/services/firestore_service.dart';

class HomeRepository {
  final FirebaseAuthService authService;
  final FirestoreService firestoreService;

  HomeRepository({
    required this.authService,
    required this.firestoreService,
  });

  Future<Map<String, String>> getUserProfile() async {
    final user = authService.currentUser;
    if (user == null) {
      throw 'No user is currently logged in.';
    }

    try {
      final doc = await firestoreService.getUserData(uid: user.uid);
      if (doc.exists) {
        final data = doc.data();
        final firstName = data?['firstName'] ?? '';
        final lastName = data?['lastName'] ?? '';
        return {
          'firstName': firstName,
          'lastName': lastName,
        };
      } else {
        return {
          'firstName': '',
          'lastName': '',
        };
      }
    } catch (e) {
      throw 'Failed to load user data';
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/core/errors/custom_exception.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserData({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _db.collection('users').doc(uid).set(data);
    } on FirebaseException catch (e) {
      throw CustomException.fromFirebaseException(e);
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData({
    required String uid,
  }) async {
    try {
      return await _db.collection('users').doc(uid).get();
    } on FirebaseException catch (e) {
      throw CustomException.fromFirebaseException(e);
    }
  }
}

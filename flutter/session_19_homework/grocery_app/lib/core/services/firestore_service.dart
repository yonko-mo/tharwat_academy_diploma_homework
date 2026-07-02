import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/core/errors/custom_exception.dart';

class FirestoreService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> addDocument({
    required Map<String, dynamic> data,
    required String collectionPath,
    String? documentId,
  }) async {
    try {
      if (documentId == null) {
        await _fireStore.collection(collectionPath).add(data);
      } else {
        await _fireStore.collection(collectionPath).doc(documentId).set(data);
      }
    } catch (e) {
      throw CustomException.fromException(e);
    }
  }

  Future<Map<String, dynamic>?> getDocument({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      final document = await _fireStore
          .collection(collectionPath)
          .doc(documentId)
          .get();
      return document.data();
    } catch (e) {
      throw CustomException.fromException(e);
    }
  }
}

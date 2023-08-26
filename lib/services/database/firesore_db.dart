import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eccommerce/models/database_cartproduct_model.dart';

class FirestoreDB {
  // Initialise Firebase Cloud Firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<CartProductModel>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => CartProductModel.fromSnapshot(doc)).toList();
    });
  }
}
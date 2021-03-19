import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _usrcollectionReference =
      FirebaseFirestore.instance.collection("Users");
  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _usrcollectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _usrcollectionReference.doc(uid).get();
  }
}

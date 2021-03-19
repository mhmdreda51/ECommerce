import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('Products');
  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection("Categories");
  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _collectionReference.get();

    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();

    return value.docs;
  }
}
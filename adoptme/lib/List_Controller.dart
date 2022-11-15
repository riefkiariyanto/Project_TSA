import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference animals = firestore.collection("animals");
    return animals.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference animals = firestore.collection("animals");
    return animals.snapshots();
  }
}

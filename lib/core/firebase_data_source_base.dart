import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseDataSourceBase<E> {
  final FirebaseFirestore instance;

  FirebaseDataSourceBase(this.instance);

  String get collectionPath;

  Future<List<E>> getAll() async {
    var collection = await instance.collection(collectionPath).get();

    var mapList = collection.docs.map((e) => e.data()).toList();

    return mapList.map((e) => fromJson(e)).toList();
  }

  Future<void> sync() async {
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: false,
    );
  }

  E fromJson(Map<String, dynamic> json);
}

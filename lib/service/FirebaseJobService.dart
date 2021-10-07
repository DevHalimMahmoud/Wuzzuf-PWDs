import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wuzzuf_pwd/models/firebaseApplicationModel.dart';
import 'package:wuzzuf_pwd/models/firebaseJobModel.dart';
import 'package:wuzzuf_pwd/service/ApplicationsService.dart';

class FirebaseJobService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<String> fireListIds = [];
  Map<String, bool> fireApi;
  FirebaseJobService({this.fireApi});
  Future<List<firebaseJobModel>> getData() async {
    CollectionReference _collectionRef = Firestore.instance.collection('job');
    QuerySnapshot querySnapshot = await _collectionRef.getDocuments();
    List<firebaseJobModel> allData = [];
    querySnapshot.documents.forEach((element) {
      allData.add(firebaseJobModel.fromMap(element.data));
      fireApi[element.data['id']] = true;
    });
    return allData;
  }

  void upLoad(firebaseJobModel model) {
    Firestore.instance.collection("job").add(model.toMap());
  }

  void upLoadApplication(firebaseApplicationModel model) {
    Firestore.instance.collection("applications").add(model.toMap());
  }

  Future<String> getUserId() async {
    final FirebaseUser user = await auth.currentUser();
    final String uid = user.uid;
    return uid;
  }
}

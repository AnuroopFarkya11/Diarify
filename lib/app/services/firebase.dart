import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/services/user_store.dart';
import '../models/notion_model/notion_model.dart';
import '../models/user_model/user_model.dart';

class FirebaseFireStore extends GetxController{
  static FirebaseFireStore get to => Get.find();
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addUser(UserModel user)async{
    log(user.toString());
    await fireStore.collection("users").doc(user.uid).set(user.toJson());
  }

  Future<UserModel?> getUser(String uid) async {
    log("hello");
    final doc = await fireStore.collection("users").doc(uid).get();
    return doc.exists ? UserModel.fromJson(doc.data()!) : null;
  }

  Stream<QuerySnapshot> getAllRecentNotions() {
    return fireStore
        .collection("notions")
        .where('userId', isEqualTo: UserStore.to.uid)
        .orderBy('dateTime', descending: true)
        .snapshots();
  }

  uploadNotion(NotionModel notion) async {
    var notionId =  fireStore
        .collection('notions')
        .doc().id;

    await fireStore
        .collection('notions')
        .doc(notionId)
        .set(notion.copyWith(
      notionId: notionId
    ).toJson());

  }

}
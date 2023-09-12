import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:snetimentaldiary/app/screens/getx_helper/state.dart';
import 'package:snetimentaldiary/app/services/firebase.dart';

import '../../models/notion_model/notion_model.dart';

class HomePageController extends GetxController {
  final state = HomePageState();

  HomePageController();

  var isLoading = true.obs;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  Future<void> onInit() async {
    await getAllRecentNotions();
    super.onInit();
  }

  onRefresh() {
    getAllRecentNotions().then(
        (_) => refreshController.refreshCompleted(resetFooterState: true));
  }

  void onLoading() {
    // asyncLoadData().then((_) =>
    refreshController.loadComplete();
    // );
  }

  getAllRecentNotions() async {
    isLoading.value = true;
    state.notionsList.clear();
    log('This is the notion');
    var res = FirebaseFireStore.to.getAllRecentNotions();
    res.listen((snapshot) {
      // state.notionsList.clear();
      for (var notion in snapshot.docChanges) {
        switch (notion.type) {
          case DocumentChangeType.added:
            if (notion.doc.data() != null) {
              Map<String, dynamic> notionData = notion.doc.data() as Map<String, dynamic>;
              state.notionsList.add(NotionModel.fromJson(notionData));
            }
            break;
          case DocumentChangeType.modified:
            if (notion.doc.data() != null) {
              log('This is the change: ${notion.doc.data()}');
              Map<String, dynamic> notionData =
                  notion.doc.data() as Map<String, dynamic>;
              int changeIndex = state.notionsList.indexWhere(
                  (element) => element.notionId == notionData['notionId']);
              state.notionsList[changeIndex] = state.notionsList[changeIndex]
                  .copyWith(
                      title: notionData['title'],
                      notionContent: notionData['notionContent']);
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
    isLoading.value = false;
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}

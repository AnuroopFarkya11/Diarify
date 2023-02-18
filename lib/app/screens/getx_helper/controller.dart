
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/screens/getx_helper/state.dart';
import 'package:snetimentaldiary/app/services/firebase.dart';

import '../../models/notion_model/notion_model.dart';

class HomePageController extends GetxController {
  final state = HomePageState();
  HomePageController();
  var isLoading = true.obs;

  getAllRecentNotions() async {
    isLoading.value = true;
    state.notionsList.clear();
    var res = await FirebaseFireStore.to.getAllRecentNotions();

    for(var notion in res.docs){
      state.notionsList.add(NotionModel.fromJson(notion.data() as Map<String, dynamic>));
    }
    isLoading.value = false;

  }
}
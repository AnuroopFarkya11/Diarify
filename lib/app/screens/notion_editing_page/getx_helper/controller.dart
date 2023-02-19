
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/API/api_client.dart';
import 'package:snetimentaldiary/app/models/sentimental_model/sentimental_model.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/getx_helper/state.dart';
import 'package:snetimentaldiary/app/services/firebase.dart';

import '../../../routes/route_paths.dart';
import '../../../services/user_store.dart';

class NotionEditingController extends GetxController {
  final state = NotionEditingState();
  NotionEditingController();
  var prev = ''.obs;
  var isLoading = true.obs;

  detectEmotion(Map<String, dynamic> detectedSentence) async {
    var data =  await ApiClient.to.postData(
      '',
      detectedSentence
    );
    if(data.statusCode == 200){
      state.sentimentalData.value = SentimentalModel.fromJson(data.body);
    }
  }

  uploadMyNotion(String title, String content) async {
    await FirebaseFireStore.to
        .uploadNotion(
        state.notionToUpload.value.copyWith(
          userId: UserStore.to.uid,
          title: title,
          notionContent: content,
          dateTime: DateTime.now(),
        )
    );
    Get.offAndToNamed(RoutePaths.homePage);
  }
}

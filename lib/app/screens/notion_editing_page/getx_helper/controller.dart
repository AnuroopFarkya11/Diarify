
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/API/api_client.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/getx_helper/state.dart';

class NotionEditingController extends GetxController {
  final state = NotionEditingState();
  NotionEditingController();
  var isLoading = true.obs;

  detectEmotion(Map<String, dynamic> detectedSentence) async {
    var data =  await ApiClient.to.postData(
      '',
        detectedSentence
    );
    // if(data.statusCode == 200){
    //   return data.body;
    // }
    // return null;
    //   return data.body;

    return data.body;
  }
}
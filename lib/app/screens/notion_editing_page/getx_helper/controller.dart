
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final audioPlayer = AudioPlayer();

  var isPlaying = false.obs;


  @override
  void onInit() {
    var chatData = Get.parameters;
    titleController.text = chatData['title']?? '';
    contentController.text = chatData['content']?? '';
    super.onInit();
  }

  playSong()async {
    if (isPlaying.value) {
      await audioPlayer.pause();
      isPlaying.value = false;
    }
    else {
      String url = "https://drive.google.com/uc?export=view&id=1R6y8xTKmmy66mix6HmptVGebEBPd8k24";
      await audioPlayer.play(url);
      isPlaying.value = true;
    }
  }

  playSongOnEmotion()async {
    isPlaying.value = true;
    String url = "https://drive.google.com/uc?export=view&id=1R6y8xTKmmy66mix6HmptVGebEBPd8k24";
    await audioPlayer.play(url);
  }

  detectEmotion(Map<String, dynamic> detectedSentence) async {
    log(detectedSentence.toString());
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
  }
}

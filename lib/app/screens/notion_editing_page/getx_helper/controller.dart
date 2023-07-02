
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

  final Map<String, String> songs = {
    'joy': 'https://firebasestorage.googleapis.com/v0/b/sentimentaldiary.appspot.com/o/Songs%2Fhappy%201.mp3?alt=media&token=9acc5fde-adf4-4c4d-8673-d4fb8e65203d',
    'sadness': 'https://firebasestorage.googleapis.com/v0/b/sentimentaldiary.appspot.com/o/Songs%2Fsad%201.mp3?alt=media&token=192f9f77-556a-4fc7-8b1c-eeb9338fa0f7',
    'fear': 'https://firebasestorage.googleapis.com/v0/b/sentimentaldiary.appspot.com/o/Songs%2Ffear%201.mp3?alt=media&token=a0d1da60-1807-4787-9beb-60448d6d9f3d',
    'anger': 'https://firebasestorage.googleapis.com/v0/b/sentimentaldiary.appspot.com/o/Songs%2Fangry%201.mp3?alt=media&token=91895db9-c1ab-410f-9e37-540465b4d716',
    'surprise': 'https://firebasestorage.googleapis.com/v0/b/sentimentaldiary.appspot.com/o/Songs%2Ffear%201.mp3?alt=media&token=a0d1da60-1807-4787-9beb-60448d6d9f3d',
  };

  var isPlaying = false.obs;


  @override
  void onInit() {
    var chatData = Get.parameters;
    titleController.text = chatData['title']?? '';
    contentController.text = chatData['content']?? '';
    super.onInit();
  }

  pauseSong() async {
    if (isPlaying.value) {
      await audioPlayer.pause();
      isPlaying.value = false;
    }else{
      await audioPlayer.play(songs[state.sentimentalData.value.sentiment]!);
      isPlaying.value = true;
    }
  }

  playSong() async {
    if (isPlaying.value) {
      await audioPlayer.pause();
    }
    await audioPlayer.play(songs[state.sentimentalData.value.sentiment]!);
    isPlaying.value = true;
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

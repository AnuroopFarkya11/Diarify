
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
    'joy': 'asset/songs/love 1.mp3',
    'sadness': 'asset/songs/sad 2.mp3',
    'fear': 'asset/songs/fear 1.mp3',
    'anger': 'asset/songs/sad 1.mp3',
    'surprise': 'asset/songs/happy 1.mp3',
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
      // await audioPlayer.play(songs[state.sentimentalData.value.sentiment]!);
      isPlaying.value = true;
    }
  }

  playSong() async {
    if (isPlaying.value) {
      await audioPlayer.pause();
    }
    // await audioPlayer.play(songs[state.sentimentalData.value.sentiment]!);
    isPlaying.value = true;
  }

  detectEmotion(Map<String, dynamic> detectedSentence) async {
    log(detectedSentence.toString());
    var data =  await ApiClient.to.postData(
      '',
      detectedSentence
    );
    if(data.body != null){
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

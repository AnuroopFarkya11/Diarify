
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/API/api_client.dart';
import 'package:snetimentaldiary/app/models/sentimental_model/sentimental_model.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/getx_helper/state.dart';
import 'package:snetimentaldiary/app/services/firebase.dart';

import '../../../services/user_store.dart';

class NotionEditingController extends GetxController {
  final state = NotionEditingState();
  NotionEditingController();
  var prev = ''.obs;
  var isLoading = true.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final audioPlayer = AudioPlayer();
  int count  = 0 ;
  @override
  void onClose() {
    audioPlayer.pause();
    super.onClose();
  }

  final Map<String, String> songs = {
    'joy': 'songs/love_1.mp3',
    'sadness': 'songs/sad_2.mp3',
    'fear': 'songs/fear_1.mp3',
    'anger': 'songs/sad_1.mp3',
    'surprise': 'songs/happy_1.mp3',
  };

  var isPlaying = false.obs;


  @override
  void onInit() {
    var chatData = Get.parameters;
    titleController.text = chatData['title']?? '';
    contentController.text = chatData['content']?? '';
    super.onInit();
  }

  togglePlayer() async {
    if (isPlaying.value) {
      await audioPlayer.pause();
      isPlaying.value = false;
    }else{
      if(songs[state.sentimentalData.value.sentiment] != null){
        await audioPlayer.play(AssetSource(songs[state.sentimentalData.value.sentiment]!));
      }else{
        await audioPlayer.play(AssetSource(songs['joy']!));
      }
      isPlaying.value = true;
    }
  }

  playSong() async {
    if (isPlaying.value) {
      await audioPlayer.pause();
    }
    await audioPlayer.play(AssetSource(songs[state.sentimentalData.value.sentiment]!));
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
      if(count == 0){
        Get.snackbar(
          "Diarify",
          'Diarify is detecting the song',
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(
            Icons.music_note,
            color: Color(0xff28282B),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey[200],
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          colorText: const Color(0xff28282B),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }else{
        Get.snackbar(
          "Diarify",
          'Sentiment changed',
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(
            Icons.music_note,
            color: Color(0xff28282B),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey[200],
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          colorText: const Color(0xff28282B),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
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

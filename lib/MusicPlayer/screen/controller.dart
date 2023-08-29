import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Sentiment { Blank, HAPPY, SAD, ANGRY, LOVE }

enum Music { STOP, PLAY, PAUSE }

class MusicController extends GetxController {
  late AssetsAudioPlayer audioPlayer;
  late Rx<Sentiment> sentimentStatus;
  late Rx<Music> status;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    audioPlayer = AssetsAudioPlayer();
    sentimentStatus = Sentiment.Blank.obs;
    status = Music.STOP.obs;
  }

  void playSong(Sentiment sentiment) {
    /*
    *  There will switch case
    *
    * */
    status.value = Music.PLAY;

    switch (sentiment) {
      case Sentiment.SAD:
        {
          sentimentStatus.value = Sentiment.SAD;
          log(sentimentStatus.toString());
          audioPlayer.open(Audio("asset/songs/sad 1.mp3"));
          break;
        }

      case Sentiment.ANGRY:
        {
          sentimentStatus.value = Sentiment.ANGRY;
          audioPlayer.open(
              Audio("asset/songs/angry 1.mp3", metas: Metas(title: "Angry")));
          break;
        }

      case Sentiment.LOVE:
        {
          sentimentStatus.value = Sentiment.LOVE;
          audioPlayer.open(Audio("asset/songs/love 1.mp3"));
          break;
        }

      case Sentiment.HAPPY:
        {
          sentimentStatus.value = Sentiment.HAPPY;
          audioPlayer.open(
            Audio("asset/songs/happy 1.mp3"),
          );

          break;
        }

      case Sentiment.Blank:
        // TODO: Handle this case.
        break;
    }
  }

  void playStatus(Music s) {
    if (s == Music.PLAY) {
      status.value = Music.PLAY;
      audioPlayer.play();
    } else if (status == Music.PAUSE) {
      status.value = Music.PAUSE;
      audioPlayer.pause();
    } else {
      status.value = Music.STOP;
      audioPlayer.stop();
    }
  }
}

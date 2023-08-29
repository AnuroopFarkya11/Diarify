import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/MusicPlayer/screen/controller.dart';

class MusicPlayerScreen extends GetView<MusicController> {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  //make a function that plays a song according to the input genre

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          ListView(
            shrinkWrap: true,
            children: [
            Card(
              margin: EdgeInsets.all(12),
              elevation: 10,
              child: ListTile(
                title: Text("Happy"),
                onTap: () {
                  controller.playSong(Sentiment.HAPPY);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.all(12),
              elevation: 10,
              child: ListTile(
                title: Text("LOVE"),
                onTap: () {
                  controller.playSong(Sentiment.LOVE);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.all(12),
              elevation: 10,
              child: ListTile(
                title: Text("SAD"),
                onTap: () {
                  controller.playSong(Sentiment.SAD);
                },
              ),
            ),
            Card(
              margin: EdgeInsets.all(12),
              elevation: 10,
              child: ListTile(
                title: Text("ANGRY"),
                onTap: () {
                  controller.playSong(Sentiment.ANGRY);
                },
              ),
            ),
          ],),

          Obx(
            () => Container(
              color: Colors.lightBlueAccent,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.music_note),
                    backgroundColor: Colors.white,
                  ),
                  Text(controller.sentimentStatus.toString()),
                   IconButton(
                        onPressed: () {
                          controller.playStatus(controller.status == Music.PLAY
                              ? Music.PAUSE
                              : Music.PLAY);
                        },
                        icon: controller.status.value == Music.PLAY
                            ? Icon(Icons.pause_circle)
                            : Icon(Icons.play_circle)),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

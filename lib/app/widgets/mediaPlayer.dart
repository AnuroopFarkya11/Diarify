import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/getx_helper/controller.dart';

class BottomPlayer extends GetView<NotionEditingController> {
  final audioPlayer = AudioPlayer();

  bool isPlaying = false;

  Duration duration = Duration.zero;

  Duration position = Duration.zero;


  // @override
  // void initState()
  // {
  //   audioPlayer.onPlayerStateChanged.listen((event) {
  //     setState(() {
  //       isPlaying = event ==PlayerState.PLAYING;
  //     });
  //   });
  //
  // }

  playSong()async{
    if(isPlaying) {
      await audioPlayer.pause();
      isPlaying = false;
    }
    else
    {
      String url = "https://drive.google.com/uc?export=view&id=1R6y8xTKmmy66mix6HmptVGebEBPd8k24";
      await audioPlayer.play(url);
      isPlaying=true;
  }


}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Center(
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Obx(
                () => Text(
                  controller.state.sentimentalData.value.sentiment != ''
                      ? 'Current mood is ${controller.state.sentimentalData.value.sentiment}'
                      : "Sentiment Analyzed ",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              //PLAY/PAUSE
              Obx(
              () => CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      controller.isPlaying.value ? Icons.pause:Icons.play_arrow,
                      size: 33,
                    ),
                    onPressed: ()async{
                      controller.playSong();
                    }
                  ),
                ),
              ),
            ],
          )



      ),
    );
  }
}

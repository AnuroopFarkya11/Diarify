import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/getx_helper/controller.dart';

class BottomPlayer extends GetView<NotionEditingController> {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
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
                    fontWeight: FontWeight.w500,
                    color: Colors.white
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
                      controller.togglePlayer();
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

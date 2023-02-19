import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/getx_helper/controller.dart';
import 'package:snetimentaldiary/app/widgets/EnterTitleWidget.dart';
import 'package:snetimentaldiary/app/widgets/WriteDiary.dart';
import 'package:snetimentaldiary/app/widgets/mediaPlayer.dart';

import '../../widgets/WriteHere.dart';

class NotionEditingPage extends GetView<NotionEditingController> {
  NotionEditingPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(child: EnterTitleWidget()),
                  IconButton(
                    icon: const Icon(
                      Icons.save,
                      size: 40,
                    ),
                    onPressed: ()async{
                      await controller.uploadMyNotion(controller.title_controller.text, controller.content_controller.text);
                    },
                  )
                ],
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        minLines: 1,
                        maxLines: 10,
                        controller: controller.content_controller,
                           onChanged: (text) async {
                             if(text.endsWith('.')){
                               List<String> segments = text.split('.');
                               log(segments.toString());
                               await controller.detectEmotion(
                                   {
                                     'string': segments[segments.length-2]
                                   }
                               );
                               if(controller.state.sentimentalData.value.sentiment != controller.prev.value){
                                 controller.prev.value = controller.state.sentimentalData.value.sentiment;
                                 //Trigger the media player
                                 controller.playSong();
                               }
                             }
                             if(text.endsWith(',')){
                               List<String> segments = text.split(',');
                               await controller.detectEmotion(
                                   {
                                     'string': segments[segments.length-1]
                                   }
                               );
                               if(controller.state.sentimentalData.value.sentiment != controller.prev.value){
                                 controller.prev.value = controller.state.sentimentalData.value.sentiment;
                                 //Trigger the media player
                               }
                             }
                           },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Start Typing...!",
                              hintStyle: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ),
                ),
                ),
            ),
            BottomPlayer()
          ],
        ),
      ),
    );
  }
}

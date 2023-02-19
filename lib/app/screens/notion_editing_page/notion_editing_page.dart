import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/getx_helper/controller.dart';

class NotionEditingPage extends GetView<NotionEditingController> {
  const NotionEditingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                 onChanged: (text) async {
                   if(text.endsWith('.')){
                     List<String> segments = text.split('.');
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
    );
  }
}

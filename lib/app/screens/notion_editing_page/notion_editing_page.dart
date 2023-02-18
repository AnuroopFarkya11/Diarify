import 'dart:developer';

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
                   List<String> sentences = text.split('.');
                   sentences[sentences.length-1];
                   var data = await controller.detectEmotion(
                       {
                         'string': "I am  happy"
                       }
                   );
                   log('This is the data from post method : $data');
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

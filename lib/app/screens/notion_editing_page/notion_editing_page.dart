import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snetimentaldiary/app/screens/notion_editing_page/getx_helper/controller.dart';
import 'package:snetimentaldiary/app/widgets/mediaPlayer.dart';

class NotionEditingPage extends GetView<NotionEditingController> {
  const NotionEditingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece9e6),
      appBar: AppBar(
        title: const Text('Sentimental Diary'),
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              size: 40,
            ),
            onPressed: () async {
              await controller.uploadMyNotion(controller.titleController.text, controller.contentController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  child: TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    controller: controller.titleController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.amber,
                      hintText: "Start Typing...",
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                      labelText: 'Title',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: TextFormField(
                  maxLines: 21,
                  keyboardType: TextInputType.multiline,
                  controller: controller.contentController,
                  onChanged: (text) async {
                    if(text.endsWith('.') && '.'.allMatches(text).length%3 == 0){
                      List<String> segments = text.split('.');
                      await controller.detectEmotion(
                          {
                            'string': segments[segments.length-4] + segments[segments.length-3] + segments[segments.length-2]
                          }
                      );
                      if(controller.state.sentimentalData.value.sentiment != controller.prev.value){
                        controller.prev.value = controller.state.sentimentalData.value.sentiment;
                        await controller.playSong();
                      }
                    }
                    if(text.endsWith(',')){
                      List<String> segments = text.split(',');
                      await controller.detectEmotion({'string': segments[segments.length-1]});
                      if(controller.state.sentimentalData.value.sentiment != controller.prev.value){
                        controller.prev.value = controller.state.sentimentalData.value.sentiment;
                        await controller.playSong();
                      }
                    }
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: Colors.amber,
                    hintText: "Start Typing...",
                    alignLabelWithHint: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Description',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const BottomPlayer()
            ],
          ),
        ),
      ),
    );
  }
}

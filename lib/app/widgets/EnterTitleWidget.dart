import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/notion_editing_page/getx_helper/controller.dart';

class EnterTitleWidget extends  GetView<NotionEditingController>{
  const EnterTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF58AEFE),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        child: TextField(
          controller: controller.titleController,
          decoration: const InputDecoration(
            hintText: "Enter Title",
            hintStyle: TextStyle(
              fontSize: 25,
              color: Colors.white
            ),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.title_rounded,color: Colors.white,size: 40,)
          ),
        )
      ),
    );
  }
}

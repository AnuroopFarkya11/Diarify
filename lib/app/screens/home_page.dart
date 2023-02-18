import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_paths.dart';
import 'getx_helper/controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece9e6),
      appBar: AppBar(title: const Text('Sentimental Diary'),),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              log('Clicked!');
              Get.toNamed(RoutePaths.notionEditingPage);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(

                  color: Color(0xFF58AEFE),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Create a new Notion',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        ),
                      ),

                      Icon(Icons.add,size: 40,)

                    ],

                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../routes/route_paths.dart';
import 'getx_helper/controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece9e6),
      appBar: AppBar(
        title: const Text('Diarify'),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: InkWell(
                onTap: (){
                  Get.toNamed(
                    RoutePaths.notionEditingPage);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Create a new Notion',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                      Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => SizedBox(
                height: MediaQuery.of(context).size.height/1.27,
                child: !controller.isLoading.value ?
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only( top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.state.notionsList.length,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                Get.toNamed(
                                    RoutePaths.notionEditingPage,
                                    parameters: {
                                      'title': controller.state.notionsList[index].title,
                                      'content': controller.state.notionsList[index].notionContent
                                    }
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffece9e6),
                                    border: Border.all(
                                        color: Colors.black,
                                        width: 1
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.state.notionsList[index].title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(
                                      controller.state.notionsList[index].notionContent,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ) : Container()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
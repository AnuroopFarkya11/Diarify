import 'package:flutter/material.dart';
import 'package:snetimentaldiary/MyWidgets/EnterTitleWidget.dart';
import 'package:snetimentaldiary/MyWidgets/MusicPlayer.dart';
import 'package:snetimentaldiary/MyWidgets/WriteDiary.dart';

class WriteHere extends StatelessWidget {
  const WriteHere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffece9e6),
      appBar: AppBar(
        title: Text('Sentimental Diary'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: EnterTitleWidget()),
                    IconButton(
                      icon: Icon(
                        Icons.save,
                        size: 45,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),

            ),
          WriteDiary(),

          Flexible(child: MusicPlayer())
          // MusicPlayer()
        ],
      ),
    );
  }
}

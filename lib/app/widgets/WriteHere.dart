import 'package:flutter/material.dart';

import 'EnterTitleWidget.dart';
import 'WriteDiary.dart';

class WriteHere extends StatelessWidget {
  const WriteHere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffece9e6),
      appBar: AppBar(
        title: const Text('Sentimental Diary'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                    child: EnterTitleWidget()),
                IconButton(
                  icon: const Icon(
                    Icons.save,
                    size: 45,
                  ),
                  onPressed: (){},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

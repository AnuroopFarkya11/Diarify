import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 40,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_rounded,
                size: 40,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 40,
              )),
        ],
      ),
    );
  }
}

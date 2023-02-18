import 'package:flutter/material.dart';

class WriteDiary extends StatelessWidget {
  const WriteDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                border: InputBorder.none,
                  hintText: "Start Typing...!",
                  hintStyle: TextStyle(fontSize: 20)
                ),
              ),
            ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Splashing extends StatefulWidget {
  const Splashing({Key? key}) : super(key: key);

  @override
  State<Splashing> createState() => _SplashingState();
}

class _SplashingState extends State<Splashing> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Reading)))
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

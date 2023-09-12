import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Scaffold(
      appBar: AppBar(
        title: Text("Audio player"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    player.play(AssetSource('happy.mp3'));
                  },
                  icon: Icon(Icons.play_arrow)),
              IconButton(
                  onPressed: () {
                    // AudioCache().play("happy.mp3");
                    player.pause();
                  },
                  icon: Icon(Icons.pause)),
            ],
          )
        ],
      ),
    );
  }
}

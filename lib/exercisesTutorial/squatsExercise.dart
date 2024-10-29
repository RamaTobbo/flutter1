import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class squatsExercise extends StatefulWidget {
  const squatsExercise({super.key});

  @override
  State<squatsExercise> createState() => _squatsExerciseState();
}

class _squatsExerciseState extends State<squatsExercise> {
  final videoURL = 'https://www.youtube.com/watch?v=xqvCmoLULNY';
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(initialVideoId: videoID!);
    flags:
    const YoutubePlayerFlags(
      autoPlay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Squats Exercise'),
        ),
        body: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            )
          ],
        ));
  }
}

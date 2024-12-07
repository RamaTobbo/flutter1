import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Exercisestutorial extends StatefulWidget {
  const Exercisestutorial({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<Exercisestutorial> createState() => _ExercisestutorialState();
}

class _ExercisestutorialState extends State<Exercisestutorial> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.videoUrl);
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
          title: Text(''),
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

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:track_pro/noSmartwatch/tab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RussiantwistTutorial extends StatefulWidget {
  const RussiantwistTutorial({super.key});

  @override
  State<RussiantwistTutorial> createState() => _RussiantwistTutorialState();
}

class _RussiantwistTutorialState extends State<RussiantwistTutorial> {
  final videoURL = 'https://www.youtube.com/watch?v=JyUqwkVpsi8';
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
          title: Text('Russian_Twist Exercise'),
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

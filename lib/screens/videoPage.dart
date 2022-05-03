import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class videoPage extends StatefulWidget {
  const videoPage({Key? key}) : super(key: key);

  @override
  State<videoPage> createState() => _videoPageState();
}

class _videoPageState extends State<videoPage> {
  late YoutubePlayerController _controller;

  @override
  initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "yQEondeGvKo",
      flags: YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
        captionLanguage: "pt",
      ),
    );
    _controller.toggleFullScreenMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            progressIndicatorColor: Colors.red,
            showVideoProgressIndicator: true,
            liveUIColor: Colors.amber,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class videoPage extends StatefulWidget {
  const videoPage({Key? key, required this.idVideo}) : super(key: key);

  final String idVideo;

  @override
  State<videoPage> createState() => _videoPageState();
}

class _videoPageState extends State<videoPage> {
  late YoutubePlayerController _controller;

  @override
  initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.idVideo,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
        captionLanguage: "pt",
      ),
    );
    _controller.toggleFullScreenMode();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.toggleFullScreenMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          progressIndicatorColor: Colors.red,
          showVideoProgressIndicator: true,
          bottomActions: [
            const SizedBox(width: 14.0),
            CurrentPosition(),
            const SizedBox(width: 8.0),
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                  backgroundColor: Colors.black,
                  bufferedColor: Colors.white,
                  handleColor: Colors.white,
                  playedColor: Colors.red),
            ),
            RemainingDuration(),
            const PlaybackSpeedButton(),
          ],
        ),
      ),
    );
  }
}

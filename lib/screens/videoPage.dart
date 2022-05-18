import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _controller = YoutubePlayerController(
      initialVideoId: widget.idVideo,
      flags: YoutubePlayerFlags(
        hideControls: true,
        hideThumbnail: true,
        autoPlay: true,
        enableCaption: true,
        captionLanguage: "pt-BR",
      ),
    );
    _controller.toggleFullScreenMode();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.toggleFullScreenMode();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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

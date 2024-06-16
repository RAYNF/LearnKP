import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String vidioURL;
  VideoPlayerScreen({super.key, required this.vidioURL});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  String videoURL = "https://www.youtube.com/watch?v=YMx8Bbev6T4";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      videoURL = widget.vidioURL;
    });
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () => debugPrint("title1_vidioplayer".tr()),
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
              colors:
                  ProgressBarColors(playedColor: danger, handleColor: primary),
            )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String vidioURL;
  VideoPlayerScreen({super.key, required this.vidioURL});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;
 String videoURL = "https://www.youtube.com/watch?v=YMx8Bbev6T4";
  late YoutubePlayerController _controller;

  // double speed = 1;

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

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    // _controller = VideoPlayerController.networkUrl(
    //   Uri.parse(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    //   ),
    // );

    // // Initialize the controller and store the Future for later use.
    // _initializeVideoPlayerFuture = _controller.initialize();

    // // Use the controller to loop the video.
    // _controller.setLooping(true);
    // _controller.setPlaybackSpeed(speed);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
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
          onReady: () => debugPrint("READY"),
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
    // Use a FutureBuilder to display a loading spinner while waiting for the
    // VideoPlayerController to finish initializing.
  }
}

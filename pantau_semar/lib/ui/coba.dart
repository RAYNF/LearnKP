import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantau_semar/utils/Theme.dart';
import 'package:video_player/video_player.dart';

class mainScreenYTB extends StatelessWidget {
  const mainScreenYTB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              //atas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //bagian kiri
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Container(
                          width: 40,
                          height: 36,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Youtube",
                        style: GoogleFonts.karla(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                  //bagian kanan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //mirecast
                      IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
                      //notifikasi
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications)),
                      //search
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.grey,
                          child: Text("BJ"),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 5),
              //bagian vidio1
              Column(
                children: [
                  VideoPlayerScreen(),
                ],
              )
            ],
          ),
        )));
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  // double speed = 1;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
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
        Stack(
          //bagian mp4

          children: [
            Container(
                decoration: BoxDecoration(color: danger),
                height: 200,
                width: 800,
                child: InkWell(
                  onTap: () {},
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )),
            Container(
              padding: EdgeInsets.only(left: 350),
              child: IconButton(
                onPressed: () {
                  // Wrap the play or pause in a call to `setState`. This ensures the
                  // correct icon is shown.
                  setState(() {
                    // If the video is playing, pause it.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                },
                // Display the correct icon depending on the state of the player.
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ),
            //memepercepat
            // IconButton(onPressed: (){
            //   setState(() {
            //     speed = speed++;
            //   });

            // }, icon: Icon(Icons.forward))
          ],
        ),
      ],
    );
    // Use a FutureBuilder to display a loading spinner while waiting for the
    // VideoPlayerController to finish initializing.
  }
}

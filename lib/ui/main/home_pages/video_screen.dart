import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/ui/main/explore_pages/explore_screen.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../constant/app_string.dart';
import '../widget/app_bar.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.id, required this.thumbnail});
  final String id;
  final String thumbnail;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id.toString(),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {}
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  bool isFullScreen = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: black,
      appBar: CustomAppBar(
        height: 85,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if (isFullScreen) {
                    isFullScreen = false;
                    _controller.toggleFullScreenMode();
                    setState(() {});
                  } else {
                    bottomController.getBack(true);
                  }
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: white,
                  size: 22,
                ),
              ),
              buildSizedBoxW(size.width * 0.29),
              const Text(
                AppString.videos,
                style: white20,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: widget.id == ""
              ? const Center(
                  child: Text(
                  AppString.noVideo,
                  style: white20,
                ))
              : YoutubePlayerBuilder(
                  onExitFullScreen: () {
                    SystemChrome.setPreferredOrientations(
                        DeviceOrientation.values);
                    isFullScreen = false;
                    setState(() {});
                  },
                  onEnterFullScreen: () {
                    isFullScreen = true;
                    setState(() {});
                  },
                  player: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    onReady: () {
                      _isPlayerReady = true;
                    },
                    onEnded: (data) {},
                  ),
                  builder: (context, player) => player,
                ),
        ),
      ),
    );
  }
}


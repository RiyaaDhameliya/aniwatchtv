
import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../constant/app_string.dart';
import '../widget/app_bar.dart';

class VideoScreen extends StatefulWidget {
   VideoScreen({super.key,required this.data});


  Map<String,dynamic> data;
  // final String id;
  // final String thumbnail;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;


  BottomController bottomController = BottomController();

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.data['id'].toString(),

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
    if(_controller.value.isFullScreen){
      isFullScreen = true;
      //widget.callback.call(!isFullScreen);
    }else{
      isFullScreen = false;
      //widget.callback.call(!isFullScreen);
    }

  }


  _willPop(){
    if(isFullScreen){
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }else{
      context.pop();
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  bool isFullScreen = false;
  bool _isPlayerReady = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        _willPop();
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          height: isFullScreen ? 0 :  MediaQuery.of(context).size.height *0.1,
          child:isFullScreen ? const SizedBox() : Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (isFullScreen) {
                      isFullScreen = false;
                      _controller.toggleFullScreenMode();
                      setState(() {});
                    } else {
                      // bottomController.getBack(true);
                      // Navigator.pop(context);
                      context.pop();
                    }
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 22,
                  ),
                ),
                const Text(
                  AppString.videos,
                  style: white20,
                ),
                const SizedBox(
                  width: 22,
                )
              ],
            ),
          ) ,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: widget.data['id'] == ""
                ? const Center(
                child: Text(
                  AppString.noVideo,
                  style: white20,
                ))
                : YoutubePlayerBuilder(
              // onExitFullScreen: () {
              //   isFullScreen = false;
              //   setState(() {});
              //   // SystemChrome.setPreferredOrientations(
              //   //     DeviceOrientation.values);
              //   print('Exit');
              //   widget.callback.call();
              // },
              // onEnterFullScreen: () {
              //   isFullScreen = true;
              //   setState(() {});
              //   print('Enter');
              //   widget.callback.call();
              // },
              player: YoutubePlayer(
                aspectRatio: 16 / 9,
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                onReady: () {
                  _isPlayerReady = true;
                },
              ),
              builder: (context, player) => player,
            ),
          ),
        ),
      ),
    );
  }
}










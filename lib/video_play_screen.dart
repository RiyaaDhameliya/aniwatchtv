// /*
// import 'package:aniwatch_tv/ui/main/widget/app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'constant/app_color.dart';
// import 'constant/app_string.dart';
// import 'constant/app_textstyle.dart';
//
// class VideoPlayScreen extends StatefulWidget {
//   const VideoPlayScreen({super.key, required this.id, required this.thumbnail});
//
//   final String id;
//   final String thumbnail;
//
//   @override
//   State<VideoPlayScreen> createState() => _VideoPlayScreenState();
// }
//
// class _VideoPlayScreenState extends State<VideoPlayScreen> {
//   late YoutubePlayerController _controller;
//   bool isPlayerReady = false;
//   bool _isPlayerReady = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.id.toString(),
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: false,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
//   }
//
//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {}
//   }
//
//
//   @override
//   void deactivate() {
//     _controller.pause();
//     super.deactivate();
//   }
//   bool isFullScreen = false;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       appBar: CustomAppBar(
//         height: MediaQuery.of(context).size.height * 0.12,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 15, top: 30),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   if (_controller.value.isFullScreen) {
//                     _controller.toggleFullScreenMode();
//                   } else {
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: const Icon(
//                   Icons.arrow_back_ios,
//                   color: white,
//                   size: 22,
//                 ),
//               ),
//               const Text(
//                 AppString.videos,
//                 style: white20,
//               ),
//               const SizedBox(
//                 width: 22,
//               )
//             ],
//           ),
//         ),
//       ),
//       body: YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           aspectRatio: 16 / 9,
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           progressIndicatorColor: Colors.blueAccent,
//           onReady: () {
//             _isPlayerReady = true;
//           },
//           onEnded: (data) {},
//         ),
//         builder: (context, player) => player,
//       ),
//     );
//   }
// }
// */
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:aniwatch_tv/ui/main/widget/app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'constant/app_color.dart';
// import 'constant/app_string.dart';
// import 'constant/app_textstyle.dart';
//
// class VideoPlayScreen extends StatefulWidget {
//   const VideoPlayScreen({super.key, required this.id, required this.thumbnail});
//
//   final String id;
//   final String thumbnail;
//
//   @override
//   State<VideoPlayScreen> createState() => _VideoPlayScreenState();
// }
//
// class _VideoPlayScreenState extends State<VideoPlayScreen> {
//   late YoutubePlayerController _controller;
//   bool _isPlayerReady = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.id.toString(),
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: false,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
//   }
//
//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//     }
//   }
//
//   @override
//   void deactivate() {
//     _controller.pause();
//     super.deactivate();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       appBar: CustomAppBar(
//         height: MediaQuery.of(context).size.height * 0.11,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 15, top: 15),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   if (_controller.value.isFullScreen) {
//                     _controller.toggleFullScreenMode();
//                   } else {
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: const Icon(
//                   Icons.arrow_back_ios,
//                   color: white,
//                   size: 22,
//                 ),
//               ),
//               const Text(
//                 AppString.videos,
//                 style: white20,
//               ),
//               const SizedBox(
//                 width: 22,
//               )
//             ],
//           ),
//         ),
//       ),
//       body: YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           aspectRatio: 16 / 9,
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           progressIndicatorColor: Colors.blueAccent,
//           onReady: () {
//             _isPlayerReady = true;
//           },
//           onEnded: (data) {},
//         ),
//         builder: (context, player) => player,
//       ),
//     );
//   }
// }

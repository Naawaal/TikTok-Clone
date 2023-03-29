import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/const/color_const.dart';
import 'package:video_player/video_player.dart';

class TikTokVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const TikTokVideoPlayer({super.key, required this.videoUrl});

  @override
  State<TikTokVideoPlayer> createState() => _TikTokVideoPlayerState();
}

class _TikTokVideoPlayerState extends State<TikTokVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
    )..initialize().then((value) {
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    super.dispose();

    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        color: backGroundColor,
      ),
      child: VideoPlayer(_videoPlayerController),
    );
  }
}

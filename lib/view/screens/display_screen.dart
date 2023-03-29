import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/video_controller.dart';
import 'package:tiktok_clone/view/screens/tik_tok_video_player.dart';
import 'package:tiktok_clone/view/widgets/album_rotator.dart';
import 'package:tiktok_clone/view/widgets/profile_button.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

final VideoController videoController = Get.put(VideoController());

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return PageView.builder(
        itemCount: videoController.videoList.length,
        controller: PageController(
          initialPage: 0,
          viewportFraction: 1,
        ),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              TikTokVideoPlayer(
                  videoUrl: videoController.videoList[index].videoUrl),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      videoController.videoList[index].username,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      videoController.videoList[index].caption,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      videoController.videoList[index].songName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 350,
                  margin: EdgeInsets.only(top: Get.height / 5, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileButton(
                        profilePhotoUrl:
                            videoController.videoList[index].profilePic,
                      ),
                      const Icon(
                        Icons.favorite_border_rounded,
                        size: 30,
                      ),
                      Text(videoController.videoList[index].likes.toString()),
                      const Icon(
                        Icons.comment_rounded,
                        size: 30,
                      ),
                      Text(videoController.videoList[index].commentsCount
                          .toString()),
                      const Icon(
                        Icons.share_rounded,
                        size: 30,
                      ),
                      const Text('Share'),
                      const SizedBox(
                        height: 10,
                      ),
                      const AlbumRotaor(
                          profilePicUrl:
                              'https://i.pinimg.com/564x/cb/61/0c/cb610c4b08f3046104d0e426f476633d.jpg'),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      );
    }));
  }
}

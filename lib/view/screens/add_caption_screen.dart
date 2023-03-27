import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/video_upload_controller.dart';
import 'package:tiktok_clone/view/screens/homescreen.dart';
import 'package:tiktok_clone/view/widgets/textinputfield.dart';
import 'package:video_player/video_player.dart';

class AddCaptionScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const AddCaptionScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

late VideoPlayerController videoPlayerController;

final TextEditingController musicController = TextEditingController();
final TextEditingController captionController = TextEditingController();

final videoUploadController = Get.put(VideoUploadController());

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: VideoPlayer(videoPlayerController),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextInputField(
                  bool: false,
                  controller: captionController,
                  icon: Icons.closed_caption_off_rounded,
                  labelText: 'Caption',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextInputField(
                  bool: false,
                  controller: musicController,
                  icon: Icons.music_note_rounded,
                  labelText: 'Song Name',
                ),
                const SizedBox(
                  height: 05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Get.offAll(const HomeScreen());
                      },
                      icon: const Icon(Icons.cancel_outlined),
                      label: const Text("Cancel"),
                    ),
                    const SizedBox(
                      height: 05,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        videoUploadController.uploadVideo(
                          musicController.text,
                          captionController.text,
                          widget.videoPath,
                        );
                      },
                      icon: const Icon(Icons.upload_file_rounded),
                      label: const Text("Upload"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

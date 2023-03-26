import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/const/color_const.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  Future<void> pickVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      Get.snackbar('Video Selected', video.name);
    } else {
      Get.snackbar('Error Occured ', 'Please Select Proper Video File');
    }
  }

  Future<void> pickCameraVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (video != null) {
      Get.snackbar('Video Selected', video.name);
    } else {
      Get.snackbar('Error Occured ', 'Please Capture Proper Video ');
    }
  }

  void showDialogOpt(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      await pickCameraVideo();
                    },
                    icon: const Icon(Icons.camera_rounded),
                    label: const Text('Camera'),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      await pickVideo();
                    },
                    icon: const Icon(Icons.browse_gallery_rounded),
                    label: const Text('Gallery'),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showDialogOpt(context);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            width: 140,
            height: 40,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Upload Video",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

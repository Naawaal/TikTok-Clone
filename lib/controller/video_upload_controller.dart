import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class VideoUploadController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  final uuid = const Uuid();

  Future<File> _getThumb(String path) async {
    final thumnmail = await VideoCompress.getFileThumbnail(path);

    return thumnmail;
  }

  Future<String> uploadVideoThumbToStorage(String id, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child("thumbnail").child(id);

    UploadTask uploadTask = reference.putFile(_getThumb(videoPath) as File);

    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    String uid = auth.currentUser!.uid;

    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(uid).get();

    //Todo: Video ID

    uploadVideoToStorage(
      videoID: uuid.v1(),
      videoPath: videoPath,
    );

    String thumbnail = await uploadVideoThumbToStorage(uuid.v1(), videoPath);
  }

  Future<String> uploadVideoToStorage(
      {required videoID, required String videoPath}) async {
    Reference reference =
        FirebaseStorage.instance.ref().child("videos").child(videoID);

    UploadTask uploadTask =
        reference.putFile(await _compressVideo(videoPath) as File);

    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<File?> _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.Res1280x720Quality,
    );

    return compressedVideo!.file;
  }
}

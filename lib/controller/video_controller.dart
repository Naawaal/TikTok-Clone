import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/model/video.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);

  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
      FirebaseFirestore.instance.collection('videos').snapshots().map(
        (QuerySnapshot snapshot) {
          List<Video> retVal = [];

          for (var element in snapshot.docs) {
            retVal.add(Video.fromSnap(element));
          }
          return retVal;
        },
      ),
    );
  }
}

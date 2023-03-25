import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/model/users.dart';
import 'package:tiktok_clone/view/screens/auth/login_screen.dart';
import 'package:tiktok_clone/view/screens/homescreen.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  File? image;

  RxBool isObscureText = true.obs;
  //Todo: Show & Hide password

  void showAndHidePassword() {
    isObscureText.value = !isObscureText.value;
  }

  //Todo: Pick Image //

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      final img = File(image.path);
      this.image = img;
    }
  }

  //Todo: Login Controller

  final loginEmailController = TextEditingController().obs;
  final loginPasswordController = TextEditingController().obs;

  Future<String> loginUser() async {
    final loginEmail = loginEmailController.value.text.trim();
    final loginPassword = loginPasswordController.value.text.trim();

    try {
      if (loginEmail.isNotEmpty || loginPassword.isNotEmpty) {
        if (!loginEmail.isEmail) {
          Get.snackbar("Error", 'please enter valid email');
        } else if (loginPassword.length <= 5) {
          Get.snackbar("Error", 'please enter 6 length email');
        }
      } else {
        await auth.signInWithEmailAndPassword(
          email: loginEmail,
          password: loginPassword,
        );
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('error: =${e.toString()}');
    }

    return auth.currentUser!.uid;
  }

  //Todo: Signup Controller
  final signupNameController = TextEditingController().obs;
  final signupEmailController = TextEditingController().obs;
  final signupPasswordController = TextEditingController().obs;

  Future<void> signupUser() async {
    final signupName = signupNameController.value.text.trim();
    final signupEmail = signupEmailController.value.text.trim();
    final signupPassword = signupPasswordController.value.text.trim();

    try {
      if (signupName.isNotEmpty &&
          signupEmail.isEmail &&
          signupPassword.isNotEmpty &&
          image != null) {
        await auth.createUserWithEmailAndPassword(
          email: signupEmail,
          password: signupPassword,
        );
        final donwloadUrl = await _uploadImage();
        myUser user = myUser(
          name: signupName,
          email: signupEmail,
          profilePhoto: donwloadUrl,
          uid: auth.currentUser!.uid,
        );

        firestore
            .collection('users')
            .doc(auth.currentUser!.uid)
            .set(user.toJson());

        Get.off(() => LoginScreen());
      } else {
        Get.snackbar("Error Occured", 'please enter all the required field');
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("error: ${e.toString()}");
      Get.snackbar("Error Occured", e.toString());
    }
  }

  Future<String> _uploadImage() async {
    final storage = FirebaseStorage.instance;
    final ref =
        storage.ref().child('profile_pics').child(auth.currentUser!.uid);
    final uploadTask = ref.putFile(image!);
    TaskSnapshot snapshot = await uploadTask;
    final url = await snapshot.ref.getDownloadURL();

    return url;
  }

  //Todo: User State Persistence
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }
}

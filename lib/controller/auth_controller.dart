import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isObscureText = true.obs;

  //Todo: Show & Hide password

  void showAndHidePassword() {
    isObscureText.value = !isObscureText.value;
    print(isObscureText);
  }

  //Todo: Login Controller

  final loginEmailController = TextEditingController().obs;
  final loginPasswordController = TextEditingController().obs;

  //Todo: Signup Controller
  final signupNameController = TextEditingController().obs;
  final signupEmailController = TextEditingController().obs;
  final signupPasswordController = TextEditingController().obs;
}

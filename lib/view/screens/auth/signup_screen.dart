import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widgets/button.dart';
import 'package:tiktok_clone/view/widgets/textinputfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'appLogo',
                child: Image.asset(
                  "assets/png/tiktok.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    radius: 60,
                  ),
                  IconButton(
                    onPressed: () {
                      authController.pickImage();
                    },
                    icon: const Icon(Icons.camera_rounded),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => TextInputField(
                  controller: authController.signupNameController.value,
                  icon: Icons.person_2_rounded,
                  bool: false,
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => TextInputField(
                  controller: authController.signupEmailController.value,
                  icon: Icons.email_rounded,
                  bool: false,
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => TextInputField(
                  controller: authController.signupPasswordController.value,
                  icon: Icons.password_rounded,
                  bool: authController.isObscureText.value,
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Button(
                onPressed: () {
                  authController.signupUser();
                },
                text: 'Signup',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

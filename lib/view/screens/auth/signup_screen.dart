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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen'),
            const SizedBox(
              height: 10,
            ),
            TextInputField(
              controller: authController.signupNameController.value,
              icon: Icons.email_rounded,
              labelText: 'Name',
            ),
            const SizedBox(
              height: 10,
            ),
            TextInputField(
              controller: authController.signupEmailController.value,
              icon: Icons.email_rounded,
              labelText: 'Email',
            ),
            const SizedBox(
              height: 10,
            ),
            TextInputField(
              controller: authController.signupPasswordController.value,
              icon: Icons.password_rounded,
              labelText: 'Password',
            ),
            const SizedBox(
              height: 10,
            ),
            Button(
              onPressed: () {},
              text: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widgets/button.dart';
import 'package:tiktok_clone/view/widgets/textinputfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
            Obx(
              () => TextInputField(
                controller: authController.loginEmailController.value,
                icon: Icons.email_rounded,
                labelText: 'Email',
                bool: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              return TextInputField(
                controller: authController.loginPasswordController.value,
                icon: Icons.password_rounded,
                bool: authController.isObscureText.value,
                labelText: 'Password',
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      color: Colors.red.shade300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
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

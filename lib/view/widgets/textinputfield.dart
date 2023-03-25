import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/const/color_const.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final bool;
  final String labelText;

  TextInputField({
    super.key,
    required this.controller,
    required this.icon,
    required this.labelText,
    this.bool = true,
  });

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      obscureText: bool,
      textInputAction: labelText == "Email" || labelText == "Name"
          ? TextInputAction.next
          : TextInputAction.done,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(icon),
        border: InputBorder.none,
        labelText: labelText,
        labelStyle: const TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        suffixIcon: labelText == 'Password'
            ? Obx(
                () => IconButton(
                  onPressed: () {
                    authController.showAndHidePassword();
                  },
                  icon: Icon(
                    authController.isObscureText.value == true
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 20,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

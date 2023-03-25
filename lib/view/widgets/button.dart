import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/const/color_const.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const Button({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: Get.width,
      height: 50,
      clipBehavior: Clip.antiAlias,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

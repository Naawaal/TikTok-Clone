import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/const/color_const.dart';
import 'package:tiktok_clone/view/screens/auth/login_screen.dart';

class TikTok extends StatelessWidget {
  const TikTok({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok Clone',
      themeMode: ThemeMode.system,
      home: LoginScreen(),
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: backGroundColor,
      ),
    );
  }
}

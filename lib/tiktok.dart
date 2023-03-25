import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class TikTok extends StatelessWidget {
const TikTok ({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok Clone',
      themeMode: ThemeMode.system,
      home: const ,
      theme: ThemeData(
        useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}

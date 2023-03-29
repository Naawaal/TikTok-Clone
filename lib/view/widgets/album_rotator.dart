import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumRotaor extends StatefulWidget {
  const AlbumRotaor({super.key, required this.profilePicUrl});

  final String profilePicUrl;

  @override
  State<AlbumRotaor> createState() => _AlbumRotaorState();
}

class _AlbumRotaorState extends State<AlbumRotaor>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: 5.seconds);
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(34),
                child: Image(
                  image: NetworkImage(widget.profilePicUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

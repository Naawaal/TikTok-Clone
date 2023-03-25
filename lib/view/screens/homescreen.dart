import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/color_const.dart';
import 'package:tiktok_clone/view/widgets/custom_add_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageId = 0;

  List pageIndex = ['Home', 'Search', 'Upload Video', 'Messages', 'Profile'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          pageIndex[pageId],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageId,
        type: BottomNavigationBarType.fixed,
        backgroundColor: backGroundColor,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_rounded,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(
              Icons.search_rounded,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: customAddIcon(),
          ),
          BottomNavigationBarItem(
            label: "Messages",
            icon: Icon(
              Icons.message_rounded,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person_rounded,
              size: 25,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            pageId = index;
          });
        },
      ),
    );
  }
}

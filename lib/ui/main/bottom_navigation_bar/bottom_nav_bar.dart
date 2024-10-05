import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  BottomController bottomController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomController>(
      builder: (controller) {
        return PopScope(
          canPop: controller.screenName.contains(controller.selectedWidget),
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              controller.getBack(false);
            }
          },
          child: Scaffold(
            bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                backgroundColor: black,
                selectedItemColor: lightYellow,
                selectedIconTheme: const IconThemeData(
                  color: lightYellow,
                ),
                elevation: 0,
                type: BottomNavigationBarType.fixed, unselectedFontSize: 10,
                selectedFontSize: 10,
                // showUnselectedLabels: false,
                // showSelectedLabels: false,
                unselectedItemColor: Colors.grey.shade400,
                currentIndex: controller.selectedPage,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.play_circle,
                      size: 24,
                    ),
                    label: "Anime",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.web_stories,
                      size: 24,
                    ),
                    label: "Explore",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 24,
                    ),
                    label: "Settings",
                  ),
                ],
                onTap: (value) {
                  controller.updatePage(value);
                },
              ),
            ),
            body: controller.selectedWidget,
          ),
        );
      },
    );
  }
}

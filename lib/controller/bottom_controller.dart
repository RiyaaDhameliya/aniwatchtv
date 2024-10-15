/*
import 'package:aniwatch_tv/ui/main/explore_pages/explore_screen.dart';
import 'package:aniwatch_tv/ui/main/favorite_screen/fav_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/anime_detail_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/home_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/see_all_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/video_screen.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  Widget selectedWidget = const HomeScreen(name: '');
  Widget previousWidget = const HomeScreen(
    name: '',
  );

  Widget? secondLastScreen;

  List screenName = [
    const HomeScreen(
      name: '',
    ),
    const ExploreScreen(),
    const SettingsScreen(),
  ];

  int selectedPage = 0;
  // int selectedPage = 0;
  String userName = '';

  void setUserName(String name) {
    userName = name;
    selectedWidget = HomeScreen(name: name);
    update();
  }

  void updatePage(int pageIndex) {
    selectedPage = pageIndex;
    selectedWidget = screenName[pageIndex];
    update();
  }

  void navigateToDetailsScreen(Map<String, dynamic> data, bool from) {
    previousWidget = selectedWidget;
    print("CALLED--22 ${previousWidget.toString()}");
    if(previousWidget.toString() == "SeeAllScreen" || previousWidget.toString() == "FavouriteScreen"){
      secondLastScreen = previousWidget;
      update();
    }
    selectedWidget = AnimeDetailScreen(
      data: data,
      from: from,
    );
    update();
  }

  void navigateToSeeAll() {
    selectedWidget = const SeeAllScreen();
    update();
  }

  void getBack(bool from) {
    if (from) {
      if(secondLastScreen != null){
        selectedWidget = secondLastScreen!;
        secondLastScreen = null;
      }else{
        selectedWidget = previousWidget;
      }

      print("GO TO $selectedWidget");
    } else {
      selectedWidget = screenName[selectedPage];
    }
    update();
  }

  void navigateToVideoScreen(String id, String thumbnail) {
    previousWidget = selectedWidget;
    selectedWidget = VideoScreen(
      id: id,
      thumbnail: thumbnail,
    );
    update();
  }


  void navigateToFavScreen() {
    previousWidget = selectedWidget;
    selectedWidget = FavouriteScreen();
    update();
  }

}
*/


import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomController extends GetxController{

  PersistentTabController persistentTabController = PersistentTabController(initialIndex: 0);

  bool isVisible = true;


  void changeTab(int index){
    persistentTabController.jumpToTab(index);
    update();
  }

  void changeVisible(bool value){
    isVisible = value;
    update();
  }

}
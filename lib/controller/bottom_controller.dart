import 'package:aniwatch_tv/ui/main/explore_pages/explore_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/anime_detail_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/home_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/see_all_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/video_screen.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomController extends GetxController{

  Widget selectedWidget =  const HomeScreen(name:'');
  Widget previousWidget = const HomeScreen(name: '',);

  List screenName = [
    const HomeScreen(name: '',),
    const ExploreScreen(),
    const SettingsScreen(),
  ];

  int selectedPage = 0;
  String userName = '';


  void setUserName(String name) {
    userName = name;
    selectedWidget = HomeScreen(name: name);
    update();
  }


  void updatePage(int pageIndex){
    selectedPage = pageIndex;
    selectedWidget = screenName[pageIndex];
    update();
  }

  void navigateToDetailsScreen(Map<String,dynamic> data,bool from){
    previousWidget = selectedWidget;
    selectedWidget = AnimeDetailScreen(data: data, from: from,);
    update();
  }

  void navigateToSeeAll(){
    selectedWidget = const SeeAllScreen();
    update();
  }

  void getBack(bool from){

    if(from){
      selectedWidget = previousWidget;
    }else{
      selectedWidget =  screenName[selectedPage];
    }
    update();
  }

  void navigateToVideoScreen(String id,String thumbnail){
    previousWidget= selectedWidget;
        selectedWidget = VideoScreen(id: id,thumbnail: thumbnail,);
    update();
  }


}

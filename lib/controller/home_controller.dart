import 'dart:developer';
import 'package:aniwatch_tv/controller/fav_controller.dart';
import 'package:aniwatch_tv/graphql/get_anime_by_search.dart';
import 'package:aniwatch_tv/graphql/get_top_anime.dart';
import 'package:aniwatch_tv/graphql/get_upcoming_anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  ScrollController scrollController = ScrollController();
  FavController favController = Get.find();

  TextEditingController searchController = TextEditingController();

  bool loading = false;
  int page = 1;
  List allData = [];
  List newUpcoming = [];
  List searchData = [];

  List allTopAnime = [];
  List newTop = [];

  int screenIndex = 0;


  void setScreenIndex(int screen){
    screenIndex = screen;
    allData = [];
    if(screenIndex == 0){

      getTopAnime();
    }else if(screenIndex ==1){
      log("UPCOMING ANIME");
      getUpcomingAnime();
    }else{
      getFavData();
    }
    update();
  }


  @override
  void onInit() {

    scrollController.addListener(() {


      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        page = page+1;
        if(screenIndex == 0){

          getTopAnime();
        }else if(screenIndex ==1){
          log("UPCOMING ANIME");
          getUpcomingAnime();
        }else{
          ///favourite
        }// Perform your task
      }
    },);
    // TODO: implement onInit
    super.onInit();
  }

  getUpcomingAnime()async{
    loading = true;
    newUpcoming =await GetUpcomingAnime.getUpcomingAnime(page);
    allData.addAll(newUpcoming);
    loading = false;
    update();
  }
  getTopAnime()async{
    loading = true;

    newTop = await GetTopAnime.getTopAnime(page);
    allData.addAll(newTop);

    log("LENGTH ${allData.length}");
    loading = false;
    update();
  }


  getFavData(){
    allData.addAll(favController.favData);

    log("DATATATTATA ${allData.length}");
    update();
  }

  getAnimeBySearch(String value)async{
    loading = true;
    update();
    searchData = [];
    searchData.addAll(await GetAnimeBySearch.getAnimeBySearch(value));

    log("DATA LENGTH ${searchData.length}");
    loading = false;
    update();
  }

}
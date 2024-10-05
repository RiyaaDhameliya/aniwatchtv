import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavController extends GetxController {
  GetStorage box = GetStorage();

  List favData = [];
  List favDataId = [];

  void getFavData() {
     favData = box.read("favData") ?? [];
     favDataId = box.read("favDataId") ?? [];

     log("DATATA $favData");
     update();
  }

  void addToFav(var newData) {


    if(!favDataId.contains(newData['id'])){
      favData.add(newData);
      favDataId.add(newData['id']);
      box.write("favData", favData);
      box.write("favDataId", favDataId);
    }else{
      log("already added $favDataId");
    }

    update();
  }

  void removeFromFav(var newData) {
    favData.remove(newData);
    favDataId.remove(newData['id']);
    box.write("favData", favData);
    box.write("favDataId", favDataId);
    update();
  }


  void clearFav(){

    box.remove("favData");
    box.remove("favDataId");

  }
}

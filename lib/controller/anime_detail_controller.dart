import 'package:get/get.dart';

class AnimeDetailController extends GetxController{

  var members = 0.obs;
  var demographic = ''.obs;
  var isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  void getDemographic(Map<String, dynamic> data) {
    if (data['staff'] != null && data['staff']['pageInfo'] != null) {
      members.value = data['staff']['pageInfo']['total'];
    }

    print("DADTATATAT ${members.value}");

    data['tags'].forEach((e) {

      print("TAGSSSS $e");

      if (e['category'] == "Demographic") {
        demographic.value = e['name'];
      }
    });
  }





}
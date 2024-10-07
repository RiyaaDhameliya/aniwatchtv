import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/controller/home_controller.dart';
import 'package:aniwatch_tv/ui/main/widget/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_color.dart';
import '../../../constant/app_string.dart';
import '../../../controller/fav_controller.dart';
import '../settings_pages/common_widgets.dart';
import '../widget/app_bar.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<bool> isFavorited = List.generate(7, (index) => false);
  HomeController homeController = Get.find();
  FavController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: black,
        appBar: CustomAppBar(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 22,
                  ),
                ),
                buildSizedBoxW( width * 0.29),

                const Text(
                  AppString.favourites,
                  style: white20,
                ),
              ],
            ),
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.loading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: lightYellow,
              ));
            } else {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildGridView(favController.favData, width, height),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }

}



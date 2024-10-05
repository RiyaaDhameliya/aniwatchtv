import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/controller/home_controller.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/common_widgets.dart';
import 'package:aniwatch_tv/ui/main/widget/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_color.dart';
import '../../../constant/app_string.dart';
import '../../../controller/ads_controller.dart';
import '../../../controller/bottom_controller.dart';
import '../../../controller/fav_controller.dart';
import '../widget/app_bar.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  BottomController bottomController = Get.find();
  HomeController homeController = Get.find();
  AdsController adsController = Get.find();
  FavController favController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: black,
        appBar: CustomAppBar(
          height: 85,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    bottomController.getBack(false);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 22,
                  ),
                ),

                buildSizedBoxW(width * 0.29),
                Text(
                  homeController.screenIndex == 0
                      ? AppString.topAnime
                      : homeController.screenIndex == 1
                          ? AppString.upcomingAnime
                          : AppString.favourite,
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
                  child: Column(
                    children: [
                      Expanded(
                        child: GetBuilder<HomeController>(
                          builder: (controller) {
                            if (controller.loading) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: lightYellow,
                              ));
                            } else {
                              return SingleChildScrollView(
                                controller: controller.scrollController,
                                child: Column(
                                  children: [
                                    buildGridView(controller.allData, width, height),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}



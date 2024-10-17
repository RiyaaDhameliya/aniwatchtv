import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/constant/app_string.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/controller/ads_controller.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:aniwatch_tv/controller/fav_controller.dart';
import 'package:aniwatch_tv/controller/home_controller.dart';
import 'package:aniwatch_tv/ui/main/widget/app_bar.dart';
import 'package:aniwatch_tv/ui/main/widget/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../ad_helper.dart';


class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});
  // final Function(bool value) callBack;


  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  BottomController bottomController = Get.find();
  HomeController homeController = Get.find();
  FavController favController = Get.find();

  @override
  void initState() {

    loadAdds();
    // TODO: implement initState
    super.initState();
  }

  BannerAd? bannerAd2;


  loadAdds(){
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd2 = ad as BannerAd;
          setState(() {
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }


  @override
  void dispose() {

    bannerAd2!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          height: MediaQuery.of(context).size.height * 0.12,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 30,bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                GestureDetector(
                  onTap: () {
                    // bottomController.getBack(false);
                   context.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 22,
                  ),
                ),
                Text(
                  homeController.screenIndex == 0
                      ? AppString.topAnime
                      : homeController.screenIndex == 1
                          ? AppString.upcomingAnime
                          : AppString.favourite,
                  style: white20,
                ),
                const SizedBox(
                  width: 22,
                )
              ],
            ),
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.loading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: pinkColor,
              ));
            } else {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: GetBuilder<HomeController>(
                              builder: (controller) {
                                if (controller.loading) {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                    color: pinkColor,
                                  ));
                                } else {
                                  return SingleChildScrollView(
                                    controller: controller.scrollController,
                                    child: Column(
                                      children: [
                                        CustomGrid(allData: controller.allData,),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      GetBuilder<AdsController>(builder: (controller) {
                        if (bannerAd2 == null) {
                          return const SizedBox();
                        } else {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: bannerAd2!.size.width.toDouble(),
                              height: bannerAd2!.size.height.toDouble(),
                              child: AdWidget(ad: bannerAd2!),
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}



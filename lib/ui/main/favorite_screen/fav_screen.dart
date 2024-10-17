import 'dart:developer';
import 'package:aniwatch_tv/ad_helper.dart';
import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/constant/app_string.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/constant/routes.dart';
import 'package:aniwatch_tv/controller/ads_controller.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:aniwatch_tv/controller/fav_controller.dart';
import 'package:aniwatch_tv/controller/home_controller.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/common_widgets.dart';
import 'package:aniwatch_tv/ui/main/widget/app_bar.dart';
import 'package:aniwatch_tv/ui/main/widget/grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<bool> isFavorited = List.generate(7, (index) => false);
  HomeController homeController = Get.find();
  FavController favController = Get.find();
  BottomController bottomController = Get.find();

  @override
  void initState() {
    loadAdds();
    // TODO: implement initState
    super.initState();
  }

  BannerAd? bannerAd4;

  loadAdds() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd4 = ad as BannerAd;
          setState(() {});
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
    bannerAd4!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          height: MediaQuery.of(context).size.height * 0.12,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 30, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                buildSizedBoxW(width * 0.29),
                const Text(
                  AppString.favourites,
                  style: white20,
                ),
              ],
            ),
          ),
        ),
        body: GetBuilder<FavController>(
          builder: (controller) {
            if (false) {
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
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            GridView.builder(
                              itemCount: favController.favDataId.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.57,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                              ),
                              itemBuilder: (context, index) {
                                return Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // bottomController
                                        //     .navigateToDetailsScreen(
                                        //     allData[index],
                                        //     true);
                                        // PersistentNavBarNavigator.pushNewScreen(
                                        //   context,
                                        //   screen: AnimeDetailScreen(data: favController.favData[index], from: true,callback: (bool value) {
                                        //     dashboardController.changeVisible(value);
                                        //
                                        //   },),
                                        //   withNavBar: true,
                                        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                        // );
                                        context.pushNamed(
                                            Routes.animeDetailName,
                                            extra:
                                                favController.favData[index]);
                                        adsController.showAdd();
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      top: Radius.circular(20)),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    favController.favData[index]
                                                            ['coverImage']
                                                        ['extraLarge'],
                                                fit: BoxFit.cover,
                                                width: width * 0.6,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: extraDarkPink1,
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                bottom: Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: height * 0.01),
                                                  Text(
                                                    '${favController.favData[index]["title"]['userPreferred']}',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 0.8),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${favController.favData[index]['seasonYear']}',
                                                        style: txtGrey13,
                                                      ),
                                                      const Spacer(),
                                                      const Icon(
                                                        Icons.star_rate_rounded,
                                                        color: Colors.yellow,
                                                        size: 16,
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      Text(
                                                        '${(favController.favData[index]['averageScore'] * 0.1).toStringAsFixed(1)}',
                                                        style: white16,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: -9,
                                      right: 10,
                                      child: Container(
                                        height: height * 0.08,
                                        width: width * 0.08,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: backgroundColor,
                                        ),
                                        child: GetBuilder<FavController>(
                                          builder: (controller1) =>
                                              GestureDetector(
                                            onTap: () {
                                              if (favController.favDataId
                                                  .contains(favController
                                                      .favData[index]['id'])) {
                                                favController.removeFromFav(
                                                    favController
                                                        .favData[index]);
                                              } else {
                                                favController.addToFav(
                                                    favController
                                                        .favData[index]);
                                              }
                                              log("FAV ${favController.favData[index]['id']}");
                                            },
                                            child: favController.favDataId
                                                    .contains(favController
                                                        .favData[index]['id'])
                                                ? const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                    size: 17,
                                                  )
                                                : const Icon(
                                                    Icons.favorite_border,
                                                    color: white,
                                                    size: 17,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                            buildSizedBoxH(height * 0.1),
                          ],
                        ),
                      ),
                      GetBuilder<AdsController>(builder: (controller) {
                        if (bannerAd4 == null) {
                          return const SizedBox();
                        } else {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: bannerAd4!.size.width.toDouble(),
                              height: bannerAd4!.size.height.toDouble(),
                              child: AdWidget(ad: bannerAd4!),
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

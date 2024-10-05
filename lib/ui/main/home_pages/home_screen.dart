import 'package:aniwatch_tv/constant/app_assets.dart';
import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/constant/app_string.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/controller/ads_controller.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:aniwatch_tv/controller/fav_controller.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/common_widgets.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/gradient_text.dart';
import 'package:aniwatch_tv/ui/main/widget/grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../controller/home_controller.dart';
import '../widget/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FavController favController = Get.find();
  BottomController bottomController = Get.find();
  HomeController homeController = Get.find();
  AdsController adsController = Get.find();
  GetStorage box = GetStorage();
  List<bool> isFavorited = List.generate(7, (index) => false);

  @override
  void initState() {
    favController.getFavData();
    homeController.getTopAnime();
    homeController.getUpcomingAnime();
    adsController.loadBannerAds();
    adsController.loadInterstitialAds();

    /// adsController.showAdd();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: CustomAppBar(
        height: 130,
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 50),
              child: Row(
                children: [
                  const GradientText(
                    AppString.ani,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: darkYellow,
                        fontSize: 39,
                        fontWeight: FontWeight.w900),
                    gradient: LinearGradient(colors: [
                      darkYellow,
                      rateColor,
                    ]),
                  ),
                  Image.asset(
                    AppAssets.ani,
                    scale: 6,
                  ),
                ],
              ),
            ),
            buildDivider(size),
            buildSizedBoxH(size.height * 0.002)
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSizedBoxH( size.height * 0.02),
                        Text(
                          "Hello ${box.read("name")}!",
                          style: whiteColor27,
                        ),
                        const Text(
                          AppString.homeText1,
                          style:  txtGrey13,
                        ),
                        const Text(
                          AppString.homeText2,
                          style: txtGrey13,
                        ),
                        buildSizedBoxH( size.height * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: TextField(
                            controller: controller.searchController,
                            onChanged: (value) {
                              controller.getAnimeBySearch(value);
                            },
                            cursorColor: lightYellow,
                            style: const TextStyle(color: lightYellow),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor: txtFldGrey.withOpacity(0.5),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: txtFldText,
                                size: 19,
                              ),
                              hintText: AppString.search,
                              hintStyle: const TextStyle(color: txtFldText),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        buildSizedBoxH(size.height * 0.02),
                        controller.loading
                            ? const Center(child: CircularProgressIndicator())
                            : controller.searchController.text == ""
                                ? Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Row(
                                          children: [
                                            const Text(
                                              AppString.topAnime,
                                              style: white20,
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                controller.setScreenIndex(0);
                                                bottomController
                                                    .navigateToSeeAll();
                                              },
                                              child: const Text(
                                                AppString.seeAll,
                                                style: lightYellow13,
                                              ),
                                            ),
                                            buildSizedBoxW(size.width * 0.02),

                                            const Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: lightYellow,
                                              size: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                      buildSizedBoxH(size.height * 0.02),
                                      SizedBox(
                                        height: size.height * 0.33,
                                        child: controller.newTop.isEmpty
                                            ? const Center(
                                                child: Text(
                                                  AppString.noTopFound,
                                                  style: whiteColor,
                                                ),
                                              )
                                            : ListView.builder(
                                                itemCount:
                                                    controller.newTop.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          bottomController
                                                              .navigateToDetailsScreen(
                                                                  controller
                                                                          .newTop[
                                                                      index],
                                                                  false);
                                                          adsController
                                                              .showAdd();
                                                          adsController
                                                              .loadBannerAds();
                                                        },
                                                        child: Stack(
                                                          children: [

                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.38,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(10),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl: controller.newTop[index]
                                                                              ['coverImage']
                                                                          ['extraLarge'],
                                                                      fit: BoxFit.cover,
                                                                      height: size.height * 0.25,
                                                                      width: size.width * 0.34,
                                                                    ),
                                                                  ),
                                                                  buildSizedBoxH(size
                                                                      .height *
                                                                      0.01),

                                                                  Padding(
                                                                    padding: const EdgeInsets.only(right: 10),
                                                                    child: Text(
                                                                        '${controller.newTop[index]["title"]['userPreferred']}',
                                                                        maxLines:
                                                                            2,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style:
                                                                            white16),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: size.width *
                                                                  0.17,
                                                              top: size.height *
                                                                  0.01,
                                                              child: Container(
                                                                height:
                                                                    size.height *
                                                                        0.032,
                                                                width:
                                                                    size.width *
                                                                        0.15,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        rateColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    const Icon(
                                                                      Icons
                                                                          .star_rate_rounded,
                                                                      color:
                                                                          starColor,
                                                                      size: 20,
                                                                    ),
                                                                    Text(
                                                                      '${(controller.newTop[index]['averageScore'] * 0.1).toStringAsFixed(1)}',
                                                                      style:
                                                                          white16,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                      ),
                                      buildSizedBoxH(size.height * 0.03),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Row(
                                          children: [
                                            const Text(
                                              AppString.upcomingAnime,
                                              style: white20,
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                controller.setScreenIndex(1);
                                                bottomController
                                                    .navigateToSeeAll();
                                              },
                                              child: const Text(
                                                AppString.seeAll,
                                                style: lightYellow13,
                                              ),
                                            ),
                                            buildSizedBoxW(size.width * 0.02),
                                            const Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: lightYellow,
                                              size: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                      buildSizedBoxH(size.height * 0.02),
                                      SizedBox(
                                        height: size.height * 0.33,
                                        child: controller.newUpcoming.isEmpty
                                            ? const Center(
                                                child: Text(
                                                  AppString.noUpcomingFound,
                                                  style: whiteColor,
                                                ),
                                              )
                                            : ListView.builder(
                                                itemCount: controller
                                                    .newUpcoming.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.38,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                bottomController
                                                                    .navigateToDetailsScreen(
                                                                        controller
                                                                            .newUpcoming[index],
                                                                        false);
                                                                adsController
                                                                    .showAdd();
                                                                adsController
                                                                    .loadBannerAds();
                                                              },
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl: controller.newUpcoming[index]
                                                                              [
                                                                              'coverImage']
                                                                          [
                                                                          'extraLarge'],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height: size
                                                                              .height *
                                                                          0.25,
                                                                      width: size
                                                                              .width *
                                                                          0.34,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: size
                                                                            .width *
                                                                        0.17,
                                                                    top: size
                                                                            .height *
                                                                        0.01,
                                                                    child:
                                                                        Container(
                                                                      height: size
                                                                              .height *
                                                                          0.032,
                                                                      width: size
                                                                              .width *
                                                                          0.15,
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              rateColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(7)),
                                                                      child:
                                                                          const Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.star_rate_rounded,
                                                                            color:
                                                                                starColor,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          Text(
                                                                            '0.0',
                                                                            style:
                                                                                white16,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            buildSizedBoxH( size.height *
                                                                0.01),
                                                            Text(
                                                              '${controller.newUpcoming[index]["title"]['userPreferred']}',
                                                              maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: white16,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Row(
                                          children: [
                                            const Text(
                                              AppString.favourite,
                                              style: white20,
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                controller.setScreenIndex(2);
                                                bottomController
                                                    .navigateToSeeAll();
                                              },
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    AppString.seeAll,
                                                    style: lightYellow13,
                                                  ),
                                                  buildSizedBoxW(size.width * 0.02),
                                                  const Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: lightYellow,
                                                    size: 12,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      buildSizedBoxH(size.height * 0.02),
                                      SizedBox(
                                        height: size.height * 0.33,
                                        child: favController.favData.isEmpty
                                            ? const Center(
                                                child: Text(
                                                  AppString.noFavoriteFound,
                                                  style: whiteColor,
                                                ),
                                              )
                                            : ListView.builder(
                                                itemCount: favController
                                                            .favData.length >
                                                        10
                                                    ? 10
                                                    : favController
                                                        .favData.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.38,
                                                        child: Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                bottomController
                                                                    .navigateToDetailsScreen(
                                                                        favController
                                                                            .favData[index],
                                                                        false);
                                                                adsController
                                                                    .showAdd();
                                                                adsController
                                                                    .loadBannerAds();
                                                              },
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl: favController.favData[index]
                                                                              [
                                                                              'coverImage']
                                                                          [
                                                                          'large'],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height: size
                                                                              .height *
                                                                          0.25,
                                                                      width: size
                                                                              .width *
                                                                          0.34,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: size
                                                                            .width *
                                                                        0.17,
                                                                    top: size
                                                                            .height *
                                                                        0.01,
                                                                    child:
                                                                        Container(
                                                                      height: size
                                                                              .height *
                                                                          0.032,
                                                                      width: size
                                                                              .width *
                                                                          0.15,
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              rateColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(7)),
                                                                      child:
                                                                           Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.star_rate_rounded,
                                                                            color:
                                                                                starColor,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          Text(
                                                                            '${favController.favData[index]['averageScore'] == null ? 0.0 : (favController.favData[index]['averageScore'] * 0.1)..toStringAsFixed(1)}',
                                                                            style:
                                                                                white16,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            buildSizedBoxH( size.height *
                                                                0.01),
                                                            Text(
                                                              '${favController.favData[index]["title"]['userPreferred']}',
                                                              maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: white16,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                      ),
                                      buildSizedBoxH(size.height*0.1),
                                    ],
                                  )
                                : controller.searchData.isEmpty
                                    ? const Center(
                                        child: Text(
                                          AppString.noMatch,
                                          style: whiteColor,
                                        ),
                                      )
                                    : buildGridView(controller.searchData, size.width, size.height),
                      ],
                    ),
                  ),
                ),
                GetBuilder<AdsController>(builder: (controller) {
                  if (controller.bannerAd == null) {
                    return const SizedBox();
                  } else {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(top: 3,left: 8,right: 8),
                        decoration: const BoxDecoration(color: black),
                        width: size.width,
                        height: size.height*0.10,
                        child: AdWidget(ad: controller.bannerAd!),
                      ),
                    );
                  }
                })
              ],
            ),
          );
        },
      ),
    );
  }
}





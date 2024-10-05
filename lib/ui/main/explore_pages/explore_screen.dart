import 'package:aniwatch_tv/constant/app_assets.dart';
import 'package:aniwatch_tv/constant/app_string.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/controller/fav_controller.dart';
import 'package:aniwatch_tv/controller/home_controller.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/gradient_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../constant/app_color.dart';
import '../../../controller/ads_controller.dart';
import '../../../controller/bottom_controller.dart';
import '../settings_pages/common_widgets.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

CarouselSliderController carouselSliderController = CarouselSliderController();
BottomController bottomController = Get.find();
AdsController adsController = Get.find();

int currentItem = 0;

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: black,
        body: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.loading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: lightYellow,
              ));
            } else {
              return SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: size.height * 0.06),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              const GradientText(
                                AppString.ani,
                                style: TextStyle(
                                    color: darkYellow,
                                    fontSize: 39,
                                    fontFamily: 'Nunito',
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
                        buildSizedBoxH(size.height * 0.02),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CarouselSlider(
                              carouselController: carouselSliderController,
                              items: controller.allData.map((item) {
                                return GestureDetector(
                                  onTap: () {
                                    bottomController.navigateToDetailsScreen(
                                        controller.allData[
                                            controller.allData.indexOf(item)],
                                        true);
                                    adsController.showAdd();
                                    adsController.loadBannerAds();
                                  },
                                  child: Container(
                                    width: size.width * 0.66,
                                    decoration: BoxDecoration(
                                        color: lightBrown,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    top: Radius.circular(20)),
                                            child: CachedNetworkImage(
                                              imageUrl: item['coverImage']
                                                  ['extraLarge'],
                                              fit: BoxFit.cover,
                                              height: size.height * 0.26,
                                              width: size.width,
                                            ),
                                          ),
                                        ),
                                       buildSizedBoxH(10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              buildSizedBoxH( size.height * 0.014),
                                              Text(
                                                '${item['title']['userPreferred']}',
                                                overflow: TextOverflow.ellipsis,
                                                style: white20bold,
                                              ),
                                              buildSizedBoxH(size.height * 0.005),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${item['seasonYear']}',
                                                    style: txtFldText15,
                                                  ),
                                                  const Spacer(),
                                                  const Icon(
                                                    Icons.star_rate_rounded,
                                                    size: 18,
                                                    color: starColor,
                                                  ),
                                                  buildSizedBoxW(size.width * 0.006),
                                                  Text(
                                                    '${item['averageScore'] == null ? 0.0 : item['averageScore'] * 0.1}',
                                                    style: white16,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        buildSizedBoxH(10),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  currentItem = index;
                                  setState(() {});
                                },
                                height: size.height * 0.5,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                viewportFraction: 0.7,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                carouselSliderController.previousPage(
                                    curve: Curves.easeIn,
                                    duration:
                                        const Duration(milliseconds: 300));
                              },
                              child: Container(
                                height: size.height * 0.12,
                                width: size.width * 0.12,
                                decoration: const BoxDecoration(
                                    color: lightBrown, shape: BoxShape.circle),
                                child: Icon(
                                  Icons.arrow_left_sharp,
                                  color: Colors.white,
                                  size: size.height * 0.03,
                                ),
                              ),
                            ),
                            buildSizedBoxW(size.width * 0.04),
                            Container(
                              height: size.height * 0.17,
                              width: size.width * 0.17,
                              decoration: const BoxDecoration(
                                  color: lightBrown, shape: BoxShape.circle),
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: size.height * 0.035,
                              ),
                            ),
                            buildSizedBoxW(size.width * 0.04),
                            Container(
                              height: size.height * 0.17,
                              width: size.width * 0.17,
                              decoration: const BoxDecoration(
                                  color: lightBrown, shape: BoxShape.circle),
                              child: GetBuilder<FavController>(
                                builder: (controller1) => GestureDetector(
                                  onTap: () {
                                    int currentItemId =
                                        controller.allData[currentItem]['id'];

                                    if (controller1.favDataId
                                        .contains(currentItemId)) {
                                      controller1.removeFromFav(
                                          controller.allData[currentItem]);
                                    } else {
                                      controller1.addToFav(
                                          controller.allData[currentItem]);
                                    }
                                  },
                                  child: controller1.favDataId.contains(
                                          controller.allData[currentItem]['id'])
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.favorite_border,
                                          color: white,
                                        ),
                                ),
                              ),
                            ),
                            buildSizedBoxW(size.width * 0.04),
                            GestureDetector(
                              onTap: () {
                                carouselSliderController.nextPage(
                                    curve: Curves.easeIn,
                                    duration:
                                        const Duration(milliseconds: 300));
                              },
                              child: Container(
                                height: size.height * 0.12,
                                width: size.width * 0.12,
                                decoration: const BoxDecoration(
                                    color: lightBrown, shape: BoxShape.circle),
                                child: Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.white,
                                  size: size.height * 0.03,
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                    GetBuilder<AdsController>(builder: (controller) {
                      if (controller.bannerAd == null) {
                        return const SizedBox();
                      } else {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: controller.bannerAd!.size.width.toDouble(),
                            height: controller.bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: controller.bannerAd!),
                          ),
                        );
                      }
                    }),
                  ],
                ),
              );
            }
          },
        ));
  }
}

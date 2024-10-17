import 'dart:developer';
import 'package:aniwatch_tv/ad_helper.dart';
import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/constant/routes.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:aniwatch_tv/controller/fav_controller.dart';
import 'package:aniwatch_tv/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../constant/app_assets.dart';
import '../../../constant/app_string.dart';
import '../../../constant/text_wrapper.dart';
import '../../../controller/ads_controller.dart';
import '../settings_pages/common_widgets.dart';
import '../widget/app_bar.dart';


class AnimeDetailScreen extends StatefulWidget {
  const AnimeDetailScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  BottomController bottomController = Get.find();
  HomeController homeController = Get.find();
  FavController favController = Get.find();
  String demographic = '';
  int members = 0;

  @override
  void initState() {
    // getDemographic();
    homeController.getTopAnime();
    homeController.getUpcomingAnime();
    loadAdds();
    // TODO: implement initState
    super.initState();
  }


  BannerAd? bannerAd;


  loadAdds(){
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
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
    bannerAd!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

/*  getDemographic() {

    if(widget.data['staff']['pageInfo'] !=null){
      members = widget.data['staff']['pageInfo']['total'];
    }

    print("DADTATATAT $members");

    widget.data['tags'].forEach((e) {

      print("TAGSSSS $e");
      if (e['category']=="Demographic") {
        demographic = e['name'];
        setState(() {});
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          height: MediaQuery.of(context).size.height * 0.10,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // bottomController.getBack(widget.from);
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: white,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  AppAssets.shareIcon,
                  scale: 22,
                  color: white,
                ),
                buildSizedBoxW( size.width * 0.04),
                GetBuilder<FavController>(
                  builder: (controller) => GestureDetector(
                    onTap: () {
                      if (favController.favDataId.contains(widget.data['id'])) {
                        favController.removeFromFav(widget.data);
                      } else {
                        favController.addToFav(widget.data);
                      }
                      log("FAV ${widget.data['id']}");
                    },
                    child: favController.favDataId.contains(widget.data['id'])
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
                buildSizedBoxW(size.width * 0.04),
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: widget.data['coverImage']
                                    ['extraLarge'],
                                fit: BoxFit.cover,
                                height: size.height * 0.27,
                                width: size.width * 0.40,
                              ),
                            ),
                            buildSizedBoxW(10),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.data["title"]['userPreferred']}',
                                      style: white22bold,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    buildSizedBoxH(size.height * 0.017),
                                    Text(
                                      '${widget.data['seasonYear']}',
                                      style: whiteColor,
                                    ),
                                    buildSizedBoxH(size.height * 0.01),
                                    Text(
                                      '${widget.data['episodes']} EPISODES',
                                      style: whiteColor,
                                    ),
                                    buildSizedBoxH(size.height * 0.01),
                                    Text(
                                      '${widget.data['duration']} MIN / EP',
                                      style: whiteColor,
                                    ),
                                    buildSizedBoxH(size.height * 0.015),
                                    Container(
                                      padding: const EdgeInsets.only(left: 3,right: 8),
                                      height: size.height * 0.03,
                                      decoration: BoxDecoration(
                                        color: greenColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          buildSizedBoxW(3),
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: white,
                                            size: 20,
                                          ),
                                          Text(
                                            '${widget.data['averageScore'] == null ? 0.0 : (widget.data['averageScore'] * 0.1).toStringAsFixed(1)}',
                                            style: whiteColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        buildSizedBoxH(size.height * 0.04),
                        GestureDetector(
                          onTap: () {
                            log("DATA ${widget.data['trailer']}");

                            // bottomController.navigateToVideoScreen(
                            //     widget.data['trailer'] == null
                            //         ? ""
                            //         : widget.data['trailer']['id'],
                            //     widget.data['trailer'] == null
                            //         ? ""
                            //         : widget.data['trailer']['thumbnail']);

                            // PersistentNavBarNavigator.pushNewScreen(
                            //   context,
                            //    screen: VideoScreen(
                            //     id: widget.data['trailer'] == null
                            //       ? ""
                            //       : widget.data['trailer']['id'],       thumbnail: widget.data['trailer'] == null
                            //       ? ""
                            //       : widget.data['trailer']['thumbnail'],
                            //
                            //   ),
                            //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            // );


                            context.pushNamed(Routes.videoName,extra: {
                              'id': widget.data['trailer'] == null
                                    ? ""
                                    : widget.data['trailer']['id'],
                              'thumbnail':widget.data['trailer'] == null
                                    ? ""
                                    : widget.data['trailer']['thumbnail']

                            } );

                          },
                          child: Container(
                            height: size.height * 0.065,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              color: extraDarkPink,
                              borderRadius: BorderRadius.circular(40),
                              gradient: const LinearGradient(
                                  colors: [extraDarkPink, darkPink1],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                              ),
                            ),
                            child:  const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: blackColor,
                                  size: 40,
                                ),
                                Text(
                                  AppString.videos,
                                  style: TextStyle(color: blackColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        buildSizedBoxH(size.height*0.02),
                        buildDivider(size),
                        buildSizedBoxH(size.height*0.02),
                        GetBuilder<AdsController>(builder: (controller) {
                          if (bannerAd == null) {
                            return const SizedBox();
                          } else {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width:
                                    bannerAd!.size.width.toDouble(),
                                height:
                                    bannerAd!.size.height.toDouble(),
                                child: AdWidget(ad: bannerAd!),
                              ),
                            );
                          }
                        }),
                        buildSizedBoxH(size.height*0.02),
                        buildDivider(size),
                        Row(
                          children: [
                            Container(
                              height: size.height * 0.12,
                              width: size.width * 0.26,
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: blackColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    AppString.members,
                                    style: txtGrey,
                                  ),
                                  Text(
                                    '$members',
                                    style: green20Bold,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.12,
                              width: size.width * 0.26,
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: blackColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    AppString.favourite,
                                    style: txtGrey,
                                  ),
                                  Text(
                                    '${widget.data['favourites']}',
                                    style: lightYellow20Bold,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.12,
                              width: size.width * 0.26,
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: blackColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    AppString.popularity,
                                    style: txtGrey,
                                  ),
                                  Text(
                                    '${widget.data['popularity']}',
                                    style: red20Bold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        buildSizedBoxH(size.height * 0.05),

                        const Text(
                          AppString.synopsis,
                          style: white17W700,
                        ),
                        buildSizedBoxH(size.height * 0.02),

                        TextWrapper(text: '${widget.data['description']}'),
                        buildSizedBoxH(size.height * 0.01),

                        const Text(
                          AppString.moreInfo,
                          style: white17W700,
                        ),
                        buildSizedBoxH(size.height * 0.01),

                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  AppString.status,
                                  style: txtGrey17height2,
                                ),
                                Text(
                                  '${widget.data['status']}',
                                  style: white17W700,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  AppString.season,
                                  style: txtGrey17height2,
                                ),
                                Text(
                                  '${widget.data['season']}',
                                  style: white17W700,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  AppString.studio,
                                  style: txtGrey17height2,
                                ),
                                Text(
                                  '${widget.data['studios']['edges'][0]['node']['name']}',
                                  style: white17W700,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  AppString.source,
                                  style: txtGrey17height2,
                                ),
                                Text(
                                  '${widget.data['source']}',
                                  style: white17W700,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  AppString.demographics,
                                  style: txtGrey17height2,
                                ),
                                demographic != ""
                                    ? Text(
                                        demographic,
                                        style: white17W700,
                                      )
                                    : const Text(
                                        '-',
                                        style: white17W700,
                                      ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppString.rating,
                                  style: txtGrey17height2,
                                ),
                                Text(
                                  'R - 17+(violence & profanity)',
                                  style: white17W700,
                                ),
                              ],
                            ),
                          ],
                        ),
                        buildSizedBoxH(size.height * 0.02),

                        const Text(
                          AppString.share,
                          style: white17W700,
                        ),
                        buildSizedBoxH(size.height * 0.01),

                        Container(
                          height: size.height * 0.132,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: blackColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: size.height * 0.11,
                                  width: size.width * 0.21,
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.02),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.cat),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        AppString.recommend,
                                        style: white17W700,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            AppString.yourFrd,
                                            style: white17W700,
                                          ),
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                                // color: grey,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        AppAssets.starShine),
                                                    fit: BoxFit.cover)),
                                          )
                                        ],
                                      ),
                                      buildSizedBoxH(size.height * 0.01),
                                      Row(
                                        children: [
                                          buildSizedBoxW(size.width * 0.2),
                                          Container(
                                            height: size.height * 0.04,
                                            width: size.width * 0.26,
                                            decoration: BoxDecoration(
                                              color: textFieldColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.ios_share,
                                                  color: pinkColor,
                                                  size: size.height * 0.02,
                                                ),
                                                const Text(
                                                  AppString.shareNow,
                                                  style: pink,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
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

/*class TextWrapper extends StatefulWidget {
  const TextWrapper({super.key, required this.text});

  final String text;

  @override
  State<TextWrapper> createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: ConstrainedBox(
          constraints: isExpanded
              ? const BoxConstraints()
              : const BoxConstraints(maxHeight: 70),
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 15, color: txtGreyColor),
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
      isExpanded
          ? TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero),
              child: const Text(
                AppString.readLess,
                style: yellow15,
              ),
              onPressed: () => setState(() => isExpanded = false),
            )
          : TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero),
              child: const Text(
                AppString.readMore,
                style: yellow15W700,
              ),
              onPressed: () => setState(() => isExpanded = true),
            )
    ]);
  }
}*/



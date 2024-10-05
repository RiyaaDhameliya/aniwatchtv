import 'dart:developer';
import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/controller/ads_controller.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_textstyle.dart';
import '../../../controller/fav_controller.dart';


BottomController bottomController = Get.find();
AdsController adsController = Get.find();
FavController favController = Get.find();

GridView buildGridView(var allData,double width, double height) {
  return GridView.builder(
    itemCount: allData.length,
    physics:
    const NeverScrollableScrollPhysics(),
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
              bottomController
                  .navigateToDetailsScreen(
                  allData[index],
                  true);
              adsController.showAdd();
              adsController.loadBannerAds();
            },
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius
                        .vertical(
                        top: Radius
                            .circular(
                            20)),
                    child: CachedNetworkImage(
                      imageUrl: allData[
                      index]
                      ['coverImage']
                      ['extraLarge'],
                      fit: BoxFit.cover,
                      width: width * 0.6,
                    ),
                  ),
                ),
                Container(
                  decoration:
                  const BoxDecoration(
                    color: lightBrown,
                    borderRadius:
                    BorderRadius.vertical(
                      bottom:
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 5),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        SizedBox(
                            height: height *
                                0.01),
                        Text(
                          '${allData[index]["title"]['userPreferred']}',
                          maxLines: 2,
                          overflow:
                          TextOverflow
                              .ellipsis,
                          style:
                          const TextStyle(
                              color:
                              white,
                              fontSize:
                              14,fontWeight: FontWeight.bold,letterSpacing: 0.8),
                        ),
                        Row(
                          children: [
                            Text(
                              '${allData[index]['seasonYear']}',
                              style: txtGrey13,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons
                                  .star_rate_rounded,
                              color: Colors
                                  .yellow,
                              size: 16,
                            ),
                            SizedBox(
                              width: width *
                                  0.01,
                            ),
                            Text(
                              '${(allData[index]['averageScore'] * 0.1).toStringAsFixed(1)}',
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
                color: black,
              ),
              child:
              GetBuilder<FavController>(
                builder: (controller1) =>
                    GestureDetector(
                      onTap: () {
                        if (favController
                            .favDataId
                            .contains(
                            allData[
                        index]['id'])) {
                          favController
                              .removeFromFav(
                              allData[
                              index]);
                        } else {
                          favController.addToFav(
                              allData[
                              index]);
                        }
                        log("FAV ${allData[index]['id']}");
                      },
                      child: favController
                          .favDataId
                          .contains(
                          allData[
                          index]['id'])
                          ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 17,
                      )
                          : const Icon(
                        Icons
                            .favorite_border,
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
  );
}
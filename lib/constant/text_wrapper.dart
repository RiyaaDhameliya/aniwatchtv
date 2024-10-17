import 'package:aniwatch_tv/controller/anime_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_color.dart';
import 'app_string.dart';
import 'app_textstyle.dart';

class TextWrapper extends StatelessWidget {
   TextWrapper({super.key, required this.text});

  final String text;
  AnimeDetailController animeDetailController =Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Obx(() => AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: ConstrainedBox(
          constraints: animeDetailController.isExpanded.value
              ? const BoxConstraints()
              : const BoxConstraints(maxHeight: 70),
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: txtGreyColor,fontFamily: "Montserrat-Regular"),
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
      )),
      Obx(() => animeDetailController.isExpanded.value
          ? TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: const Text(
          AppString.readLess,
          style: yellow15,
        ),
        onPressed: () {
          animeDetailController.toggleExpansion();
        },
      )
          : TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: const Text(
          AppString.readMore,
          style: yellow15W700,
        ),
        onPressed: () {
          animeDetailController.toggleExpansion();
        },
      ))
    ]);
  }
}

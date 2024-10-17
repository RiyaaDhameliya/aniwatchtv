import 'dart:developer';
import 'package:aniwatch_tv/constant/app_assets.dart';
import 'package:aniwatch_tv/constant/app_string.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/constant/routes.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/privacy_policy_screen.dart';
import 'package:aniwatch_tv/ui/main/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'common_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _sendEmail() {
    log("CALLED");
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'our.email@gmail.com',
      queryParameters: {'subject': 'CallOut user Profile', 'body': ''},
    );
    try {
      launchUrl(emailLaunchUri);
    } catch (e) {
      log("ERROR $e");
    }
  }

  BottomController bottomController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        height: MediaQuery.of(context).size.height * 0.17,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 40, bottom: 15),
              child: Text(
                AppString.setting,
                style: white30,
              ),
            ),
            buildDivider(size),
            buildSizedBoxH(size.height * 0.002),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            buildSizedBoxH(14),
            Container(
              height: size.height * 0.085,
              decoration: BoxDecoration(
                color: settingContainer.withOpacity(0.20),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Container(
                    height: size.height*0.1,
                    width: size.width*0.1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.appVersion))),
                  ),
                  buildSizedBoxW(size.width * 0.03),
                  const Text(
                    AppString.appVersion,
                    style: white20boldFamily,
                  ),
                  const Spacer(),
                  const Text(
                    '1.2',
                    style: white20boldFamily,
                  ),
                ],
              ),
            ),
            buildSizedBoxH(5),
            GestureDetector(
              onTap: () {
                // bottomController.navigateToFavScreen();
                // PersistentNavBarNavigator.pushNewScreen(
                //   context,
                //   screen:  const FavouriteScreen(),
                //   withNavBar: true, // OPTIONAL VALUE. True by default.
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
                context.pushNamed(Routes.favouriteName);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const FavouriteScreen(),
                //     ));
              },
              child: Container(
                height: size.height * 0.085,
                decoration: BoxDecoration(
                  color: settingContainer.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Container(
                      height: size.height*0.07,
                      width: size.width*0.07,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.favorite))),
                    ),
                    buildSizedBoxW(size.width * 0.03),
                    const Text(
                      AppString.favourites,
                      style: white20,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: pinkColor,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
            buildSizedBoxH(5),
            GestureDetector(
              onTap: _sendEmail,
              child: Container(
                height: size.height * 0.085,
                decoration: BoxDecoration(
                  color: settingContainer.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:  Row(
                  children: <Widget>[
                    Container(
                      height: size.height*0.07,
                      width: size.width*0.07,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.contactus))),
                    ),
                    buildSizedBoxW(size.width * 0.03),
                    const Text(
                      AppString.contactus,
                      style: white20,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: pinkColor,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
            buildSizedBoxH(5),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: size.height * 0.085,
                decoration: BoxDecoration(
                  color: settingContainer.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:  Row(
                  children: [
                    Container(
                      height: size.height*0.07,
                      width: size.width*0.07,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.rateApp))),
                    ),
                    buildSizedBoxW(size.width * 0.03),
                    const Text(
                      AppString.rateApp,
                      style: white20,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: pinkColor,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
            buildSizedBoxH(5),
            GestureDetector(
              onTap: () {
                Share.share('check out my website https://example.com');
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => FavouriteScreen(),
                //     ));
              },
              child: Container(
                height: size.height * 0.085,
                decoration: BoxDecoration(
                  color: settingContainer.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:  Row(
                  children: [
                    Container(
                      height: size.height*0.07,
                      width: size.width*0.07,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.share))),
                    ),
                    buildSizedBoxW(size.width * 0.03),
                    const Text(
                      AppString.shareApp,
                      style: white20,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: pinkColor,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
            buildSizedBoxH(5),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: backgroundColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => const PrivacyPolicyBottomSheet(),
                );
              },
              child: Container(
                height: size.height * 0.085,
                decoration: BoxDecoration(
                  color: settingContainer.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:  Row(
                  children: [
                    Container(
                      height: size.height*0.07,
                      width: size.width*0.07,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.privacyPolicy))),
                    ),
                    buildSizedBoxW(size.width * 0.03),
                    const Text(
                      AppString.privacyPolicy,
                      style: white20,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: pinkColor,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

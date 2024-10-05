import 'dart:developer';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/ui/main/favorite_screen/fav_screen.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/privacy_policy_screen.dart';
import 'package:aniwatch_tv/ui/main/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant/app_string.dart';
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: black,
      appBar: CustomAppBar(
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 50),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouriteScreen(),
                    ));
              },
              child: Container(
                height: size.height*0.07,
                decoration: BoxDecoration(
                  border: Border.all(color: lightYellow, width: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Row(
                  children: [
                    Text(
                      AppString.favourites,
                      style: lightYellow20Bold,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: lightYellow,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Row(
                  children: [
                    Text(
                      AppString.rateApp,
                      style: white20,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: lightYellow,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Row(
                  children: [
                    Text(
                      AppString.shareApp,
                      style: white20,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: lightYellow,
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
                  backgroundColor: black,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => const PrivacyPolicyBottomSheet(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Row(
                  children: [
                    Text(
                      AppString.privacyPolicy,
                      style: white20,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: lightYellow,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Row(
                  children: [
                    Text(
                      AppString.contactus,
                      style: white20,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: lightYellow,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
            buildSizedBoxH(5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const Row(
                children: [
                  Text(
                    AppString.appVersion,
                    style: lightYellow20Bold,
                  ),
                  Spacer(),
                  Text(
                    '1.2',
                    style: lightYellow20Bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



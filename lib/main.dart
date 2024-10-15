import 'package:aniwatch_tv/constant/routes.dart';
import 'package:aniwatch_tv/controller/ads_controller.dart';
import 'package:aniwatch_tv/controller/anime_detail_controller.dart';
import 'package:aniwatch_tv/controller/fav_controller.dart';
import 'package:aniwatch_tv/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'controller/bottom_controller.dart';
import 'controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

BuildContext? testContext;


class MyApp extends StatelessWidget {
  MyApp({super.key});

  Routes routes=Routes();
  FavController favController = Get.put(FavController());
  HomeController homeController = Get.put(HomeController());
  BottomController bottomController = Get.put(BottomController());
  AdsController adsController = Get.put(AdsController());
  SplashController splashController=Get.put(SplashController());
  AnimeDetailController animeDetailController=Get.put(AnimeDetailController());




  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
        routerConfig: routes.route,
      // home: box.read("name") == null
      //     ? const SplashScreen()
      //     : const BottomNavbar(),
        // home: VideoPlayScreen(id: '6vMuWuWlW4I', thumbnail: 'https://i.ytimg.com/vi/6vMuWuWlW4I/hqdefault.jpg',),
      debugShowCheckedModeBanner: false,
    );
  }
}

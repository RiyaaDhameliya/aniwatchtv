import 'package:aniwatch_tv/controller/ads_controller.dart';
import 'package:aniwatch_tv/controller/fav_controller.dart';
import 'package:aniwatch_tv/ui/main/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:aniwatch_tv/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'controller/bottom_controller.dart';
import 'controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  GetStorage box = GetStorage();
  FavController favController = Get.put(FavController());
  HomeController homeController = Get.put(HomeController());
  BottomController bottomController = Get.put(BottomController());
  AdsController adsController = Get.put(AdsController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: box.read('name') == null
          ? const SplashScreen()
          : const BottomNavbar(),
      // home: AdsDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

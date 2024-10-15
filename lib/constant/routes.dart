import 'package:aniwatch_tv/ui/main/bottom_navigation_bar/dashbord_screen.dart';
import 'package:aniwatch_tv/ui/main/explore_pages/explore_screen.dart';
import 'package:aniwatch_tv/ui/main/favorite_screen/fav_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/anime_detail_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/home_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/see_all_screen.dart';
import 'package:aniwatch_tv/ui/main/home_pages/video_screen.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/privacy_policy_screen.dart';
import 'package:aniwatch_tv/ui/main/settings_pages/settings_screen.dart';
import 'package:aniwatch_tv/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {

 static String splashPath='/';
 static String splashName='splash';
 static String homePath='/home';
 static String homeName='home';
 static String animeDetailPath='/animeDetail';
 static String animeDetailName='animeDetail';
 static String videoPath='/video';
 static String videoName='video';
 static String animeDetail2Path='/animeDetail2';
 static String animeDetail2Name='animeDetail2';
 static String video2Path='/video2';
 static String video2Name='video2';
 static String seeAllPath='/seeAll';
 static String seeAllName='seeAll';
 static String explorePath='/explore';
 static String exploreName='explore';
 static String settingsPath='/settings';
 static String settingsName='settings';
 static String privacyPolicyPath='/privacyPolicy';
 static String privacyPolicyName='privacyPolicy';
 static String favouritePath='/favourite';
 static String favouriteName='favourite';

 static GetStorage box = GetStorage();



  final route =
      GoRouter(
        initialLocation:box.read("name") == null? splashPath : homePath,
          navigatorKey: _rootNavigatorKey,
          routes: [
            GoRoute(path: splashPath,name: splashName,builder: (context, state) => const SplashScreen(),),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return  NoTransitionPage(child: DashbordScreen(child: child));
        },
        routes: [
          GoRoute(
              path: homePath,
              name: homeName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) =>  HomeScreen()),
          GoRoute(
              path: animeDetailPath,
              name: animeDetailName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) =>  AnimeDetailScreen(data:state.extra as Map<String, dynamic> )),
          GoRoute(
              path: videoPath,
              name: videoName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) =>  VideoScreen(data: state.extra as Map<String, dynamic>)),
          GoRoute(
              path: seeAllPath,
              name: seeAllName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const SeeAllScreen()),
        ]),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return  NoTransitionPage(child:  DashbordScreen(child: child));
        },
        routes: [
          GoRoute(
              path: explorePath,
              name: exploreName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const ExploreScreen()),
          GoRoute(
              path: animeDetail2Path,
              name: animeDetail2Name,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) =>  AnimeDetailScreen(data:state.extra as Map<String, dynamic>)),
          GoRoute(
              path: video2Path,
              name: video2Name,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) =>  VideoScreen(data: state.extra as Map<String, dynamic>,)),
        ]),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return  NoTransitionPage(child:  DashbordScreen(child: child));
        },
        routes: [
          GoRoute(
              path: settingsPath,
              name: settingsName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const SettingsScreen()),
          GoRoute(
              path: privacyPolicyPath,
              name: privacyPolicyName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const PrivacyPolicyBottomSheet()),
          GoRoute(
              path: favouritePath,
              name: favouriteName,
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const FavouriteScreen()),
        ]),
  ]);
}

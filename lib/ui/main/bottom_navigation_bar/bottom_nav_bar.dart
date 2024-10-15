// /*
// import 'package:aniwatch_tv/constant/app_color.dart';
// import 'package:aniwatch_tv/controller/bottom_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class BottomNavbar extends StatefulWidget {
//   const BottomNavbar({Key? key}) : super(key: key);
//
//   @override
//   State<BottomNavbar> createState() => _BottomNavbarState();
// }
//
// class _BottomNavbarState extends State<BottomNavbar> {
//   BottomController bottomController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BottomController>(
//       builder: (controller) {
//         return PopScope(
//           canPop: controller.screenName.contains(controller.selectedWidget),
//           onPopInvokedWithResult: (didPop, result) {
//             if (!didPop) {
//               controller.getBack(false);
//             }
//           },
//           child: Scaffold(
//             bottomNavigationBar: Theme(
//               data: ThemeData(
//                 splashColor: Colors.transparent,
//               ),
//               child: BottomNavigationBar(
//                 backgroundColor: black,
//                 selectedItemColor: lightYellow,
//                 selectedIconTheme: const IconThemeData(
//                   color: lightYellow,
//                 ),
//                 elevation: 0,
//                 type: BottomNavigationBarType.fixed, unselectedFontSize: 10,
//                 selectedFontSize: 10,
//                 // showUnselectedLabels: false,
//                 // showSelectedLabels: false,
//                 unselectedItemColor: Colors.grey.shade400,
//                 currentIndex: controller.selectedPage,
//                 items: const [
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.play_circle,
//                       size: 24,
//                     ),
//                     label: "Anime",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.web_stories,
//                       size: 24,
//                     ),
//                     label: "Explore",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       Icons.settings,
//                       size: 24,
//                     ),
//                     label: "Settings",
//                   ),
//                 ],
//                 onTap: (value) {
//                   controller.updatePage(value);
//                 },
//               ),
//             ),
//             body: controller.selectedWidget,
//           ),
//         );
//       },
//     );
//   }
// }
// */
//
// import 'package:aniwatch_tv/constant/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import '../../../controller/bottom_controller.dart';
// import '../explore_pages/explore_screen.dart';
// import '../home_pages/home_screen.dart';
// import '../settings_pages/settings_screen.dart';
//
// class BottomNavbar extends StatefulWidget {
//   const BottomNavbar({super.key});
//
//   @override
//   State<BottomNavbar> createState() => _BottomNavbarState();
// }
//
// class _BottomNavbarState extends State<BottomNavbar> {
//   BottomController dashboardController = Get.put(BottomController());
//
//   @override
//   void initState() {
//     ///
//
//     // TODO: implement initState
//     super.initState();
//   }
//
//   List<CustomNavBarScreen> screens() {
//     return [
//       CustomNavBarScreen(
//           screen: HomeScreen(
//         name: '',
//         callBack: (bool value) {
//           dashboardController.changeVisible(value);
//         },
//       )),
//       CustomNavBarScreen(screen: ExploreScreen(
//         callBack: (bool value) {
//           dashboardController.changeVisible(value);
//         },
//       )),
//       CustomNavBarScreen(screen: SettingsScreen(
//         callBack: (bool value) {
//           dashboardController.changeVisible(value);
//         },
//       )),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BottomController>(
//       builder: (controller) {
//         return PersistentTabView.custom(
//           backgroundColor: black,
//           controller: dashboardController.persistentTabController,
//           isVisible: dashboardController.isVisible,
//           onWillPop: (p0) {
//             print("HELLO");
//             return Future(
//               () => false,
//             );
//           },
//           context,
//           stateManagement: true,
//           customWidget: const CustomBottomBar(),
//           itemCount: 3,
//           screens: screens(),
//         );
//       },
//     );
//   }
// }
//
// class CustomBottomBar extends StatefulWidget {
//   const CustomBottomBar({super.key});
//
//   @override
//   State<CustomBottomBar> createState() => _CustomBottomBarState();
// }
//
// class _CustomBottomBarState extends State<CustomBottomBar> {
//   List<Map<String, dynamic>> items = [
//     {'icon': Icons.play_circle, 'label': "Anime"},
//     {'icon': Icons.web_stories, 'label': "Explore"},
//     {'icon': Icons.settings, 'label': "Settings"}
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return GetBuilder<BottomController>(
//       builder: (controller) => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(
//           items.length,
//           (index) => GestureDetector(
//             onTap: () {
//               controller.changeTab(index);
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(top: 5),
//               child: Column(
//                 children: [
//                   Icon(items[index]['icon'],
//                       size: 24,
//                       color: controller.persistentTabController.index == index
//                           ? lightYellow
//                           : txtFldText
//                   ),
//                   Text(
//                     items[index]['label'],
//                     style: TextStyle(
//                         height: 1.5,
//                         fontSize: 10,
//                         fontWeight: FontWeight.normal,
//                         fontFamily: 'Roboto',
//                         decoration: TextDecoration.none,
//                         color: controller.persistentTabController.index == index
//                             ? lightYellow
//                             : txtFldText),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

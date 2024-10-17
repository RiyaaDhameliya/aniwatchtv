/*
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constant/app_assets.dart';
import '../constant/app_color.dart';
import '../constant/app_string.dart';
import '../ui/main/bottom_navigation_bar/bottom_nav_bar.dart';

class SplashController extends GetxController {
  late AnimationController animationController;
  int _contentState = 0;
  TextEditingController nameController = TextEditingController();
  GetStorage box = GetStorage();
  bool _visible = false;
  String _text = AppString.splashWelcomeText;
  String _text1 = AppString.splashWelcomeText1;
  String _image = AppAssets.splashLogo;

  void _toggleContent() {
    animationController.reset();
    animationController.forward();

    if (_contentState == 2) {
      if (nameController.text.isNotEmpty) {
        box.write('name', nameController.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavbar(),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: AppString.enterName,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: lightYellow,
          textColor: black,
          fontSize: 18,
        );
        return;
      }
    }


        _contentState = (_contentState + 1);
        if (_contentState == 0) {
          _text = AppString.splashWelcomeText;
          _text1 = AppString.splashWelcomeText1;
          _image = AppAssets.splashLogo;
        } else if (_contentState == 1) {
          _text = AppString.splashFreeText;
          _text1 = AppString.splashFreeText1;
          _image = AppAssets.splashLogo1;
        } else if (_contentState == 2) {
          _text = AppString.splashNameText;
          _text1 = "";
          _image = AppAssets.splashLogo2;
        }


      _visible = !_visible;

  }
}
*/






import 'package:aniwatch_tv/constant/app_assets.dart';
import 'package:aniwatch_tv/constant/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  int contentState = 0;
  TextEditingController nameController = TextEditingController();
  GetStorage box = GetStorage();
  String text = AppString.splashWelcomeText;
  String text1 = AppString.an;
  String text2 = AppString.i;
  String text3 = AppString.watch;
  String image = AppAssets.splashLogo;
  late Animation animation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  void toggleContent(BuildContext context) {
    animationController.reset();
    animationController.forward();



    contentState = (contentState + 1) % 3;
    if (contentState == 0) {
      text = AppString.splashWelcomeText;
      text1 = AppString.an;
      text2 = AppString.i;
      text3 = AppString.watch;
      image = AppAssets.splashLogo;
    } else if (contentState == 1) {
      text = AppString.splashFreeText;
      text1 = AppString.an;
      text2 = AppString.i;
      text3 = AppString.me;
      image = AppAssets.splashLogo;
    }
    else if (contentState == 2) {
      text = AppString.splashNameText;
      text1 = "";
      text2 = "";
      text3 = "";
      image = AppAssets.splashLogo;
    }

    update();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

import 'package:aniwatch_tv/constant/app_assets.dart';
import 'package:aniwatch_tv/constant/app_string.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/app_color.dart';
import '../controller/home_controller.dart';
import 'main/bottom_navigation_bar/bottom_nav_bar.dart';
import 'main/settings_pages/gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.find();
  BottomController bottomController = Get.find();
  TextEditingController nameController = TextEditingController();
  GetStorage box = GetStorage();

  late Animation animation;
  late AnimationController animationController;

  int _contentState = 0;
  bool _visible = false;
  String _text = AppString.splashWelcomeText;
  String _text1 = AppString.splashWelcomeText1;
  String _image = AppAssets.splashLogo;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    if (mounted) {
      animationController.forward();
    }
  }

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

    setState(() {
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
    });
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage(AppAssets.newSplashBg),
                    fit: BoxFit.cover),
              ),
              child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.04, 0.15, 0.2, 1],
                    colors: [
                      Colors.black38,
                      Colors.black45,
                      Colors.black54,
                      Colors.black,
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: animation.value,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(_image),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: animation.value,
                        child: Column(
                          children: [
                            Text(
                              _text,
                              style: GoogleFonts.roboto(
                                textStyle:
                                    const TextStyle(fontSize: 32, color: white),
                              ),
                            ),
                            GradientText(
                              _text1,
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: darkYellow,
                                  fontSize: 49,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              gradient: const LinearGradient(colors: [
                                darkYellow,
                                rateColor,
                              ]),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  _contentState == 2
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: AnimatedBuilder(
                            animation: animation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: animation.value,
                                child: TextField(
                                  controller: nameController,
                                  cursorColor: lightYellow,
                                  style: const TextStyle(color: lightYellow),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: textFieldColor,
                                    hintText: AppString.splashTxtFld,
                                    hintStyle:
                                        const TextStyle(color: lightYellow),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: lightYellow)),
                                  ),
                                ),
                              );
                            },
                          ))
                      : const SizedBox(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: List.generate(
                            3,
                            (index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                height: size.height * 0.015,
                                width: size.width * 0.015,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _contentState == index
                                        ? lightYellow
                                        : lightBrown),
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                        MaterialButton(
                          height: size.height * 0.056,
                          minWidth: size.width * 0.23,
                          color: lightYellow,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: _toggleContent,
                          child: Text(
                            AppString.next,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


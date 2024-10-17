import 'package:aniwatch_tv/constant/app_assets.dart';
import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/constant/app_string.dart';
import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:aniwatch_tv/controller/bottom_controller.dart';
import 'package:aniwatch_tv/controller/home_controller.dart';
import 'package:aniwatch_tv/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.find();
  BottomController bottomController = Get.find();
  // TextEditingController nameController = TextEditingController();
  SplashController splashController = Get.find();
  GetStorage box = GetStorage();

  // late Animation animation;
  // late AnimationController animationController;
  // int contentState = 0;
  // bool _visible = false;
  // String _text = AppString.splashWelcomeText;
  // String _text1 = AppString.splashWelcomeText1;
  // String _image = AppAssets.splashLogo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    // animationController = AnimationController(
    //   duration: const Duration(seconds: 2),
    //   vsync: this,
    // );
    // animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
    //     parent: animationController, curve: Curves.fastOutSlowIn));
    // if (mounted) {
    //   animationController.forward();
    // }
  }
/*
  void _toggleContent() {
    animationController.reset();
    animationController.forward();

    if (contentState == 2) {
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
      contentState = (contentState + 1);
      if (contentState == 0) {
        _text = AppString.splashWelcomeText;
        _text1 = AppString.splashWelcomeText1;
        _image = AppAssets.splashLogo;
      } else if (contentState == 1) {
        _text = AppString.splashFreeText;
        _text1 = AppString.splashFreeText1;
        _image = AppAssets.splashLogo1;
      } else if (contentState == 2) {
        _text = AppString.splashNameText;
        _text1 = "";
        _image = AppAssets.splashLogo2;
      }
    });
    setState(() {
      _visible = !_visible;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GetBuilder<SplashController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: backgroundColor,
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
                        stops: [0.04, 0.15, 1],
                        colors: [
                          Colors.black38,
                          Colors.black45,
                          backgroundColor,
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedBuilder(
                        animation: controller.animation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: controller.animation.value,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(controller.image),
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
                  decoration: const BoxDecoration(color: backgroundColor),
                  child: Column(
                    children: [
                      AnimatedBuilder(
                        animation: controller.animation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: controller.animation.value,
                            child: Column(
                              children: [
                                /*  Text(
                                  controller.text,
                                  style: GoogleFonts.roboto(
                                    textStyle: white32
                                  ),
                                ),*/
                                Text(
                                  controller.text,
                                  style: white28,
                                ),
                                /*  GradientText(
                                  controller.text1,
                                  style: GoogleFonts.roboto(
                                    textStyle: lightYellow49bold
                                  ),
                                  gradient: const LinearGradient(colors: [
                                    darkYellow,
                                    rateColor,
                                  ]),
                                ),*/
                               controller.contentState==0? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.text1,
                                      style: white50,
                                    ),
                                    Text(
                                     controller.text2,
                                      style: darkPink50,
                                    ),
                                    Text(
                                      controller.text3,
                                      style: white50,
                                    ),
                                  ],
                                ):controller.contentState==1?Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text(
                                     controller.text1,
                                     style: white50,
                                   ),
                                   Text(
                                     controller.text2,
                                     style: darkPink50,
                                   ), Text(
                                     controller.text3,
                                     style: white50,
                                   ),
                                 ],
                               ):const SizedBox(),
                              ],
                            ),
                          );
                        },
                      ),
                      controller.contentState == 2
                          ? Padding(
                              padding:
                                  const EdgeInsets.all(20),
                              child: AnimatedBuilder(
                                animation: controller.animation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: controller.animation.value,
                                    child: TextField(
                                      controller: controller.nameController,
                                      cursorColor: pinkColor,
                                      style: const TextStyle(color: pinkColor),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: textFieldColor,
                                        hintText: AppString.splashTxtFld,
                                        hintStyle:
                                            const TextStyle(color: pinkColor,fontFamily: "Montserrat-Regular"),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(color: pinkColor),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: pinkColor),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                              color: pinkColor),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox(),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              height: size.height * 0.005,
                              width: size.width * 0.075,
                              decoration: BoxDecoration(
                                color: controller.contentState == index
                                    ? pinkColor
                                    : pinkColor.withOpacity(0.4),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: MaterialButton(
                          height: size.height * 0.07,
                          minWidth: size.width * 0.8,
                          color: pinkColor,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () {
                            if (controller.contentState == 2) {
                              if (controller.nameController.text.isNotEmpty) {
                                box
                                    .write(
                                        'name', controller.nameController.text)
                                    .then(
                                  (value) {
                                    setState(() {});
                                    context.go('/home',
                                        extra: controller.nameController.text);
                                  },
                                );
                                //Get.to(() =>  DashbordScreen(child: const Center(child: Text("Empty"),),));
                              } else {
                                Fluttertoast.showToast(
                                  msg: AppString.enterName,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: pinkColor,
                                  textColor: Colors.black,
                                  fontSize: 18,
                                );
                                return;
                              }
                            } else {
                              controller.toggleContent(context);
                            }
                          },
                          child: const Text(
                            AppString.next,
                            style:  black17W700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

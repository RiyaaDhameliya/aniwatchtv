import 'package:aniwatch_tv/constant/app_color.dart';
import 'package:aniwatch_tv/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashbordScreen extends StatefulWidget {
   DashbordScreen({super.key,required this.child});
  Widget child;

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {

  int index = 0;

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;

    print("${size.height * 0.034}");


    return Scaffold(
      bottomNavigationBar: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.landscape){
            return const SizedBox();
          }else{
            return BottomNavigationBar(
                currentIndex: index,
                elevation: 0,
                selectedItemColor: const Color(0xffFFA8D5),
                unselectedItemColor: txtFldText,
                selectedLabelStyle: const TextStyle(fontFamily: "Montserrat-Regular"),
                unselectedLabelStyle: const TextStyle(fontFamily: "Montserrat-Regular"),
                backgroundColor: backgroundColor,
               type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  if(value==0){
                    index=value;
                    context.pushNamed(Routes.homeName);
                  }else if(value==1){
                    index=value;
                    context.pushNamed(Routes.exploreName);
                  }else{
                    index=value;
                    context.pushNamed(Routes.settingsName);
                  }
                  setState(() {});
                },
                items:  [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home,size: size.height * 0.034,), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.web_stories,size: size.height * 0.030), label: "Explore"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings,size: size.height * 0.030), label: "Settings"),
                ]);
          }
        },
      ),
      body: widget.child,
    );
  }
}

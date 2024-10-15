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
    return Scaffold(
      bottomNavigationBar: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.landscape){
            return const SizedBox();
          }else{
            return BottomNavigationBar(
                currentIndex: index,
                selectedItemColor: lightYellow,
                unselectedItemColor: txtFldText,
                backgroundColor: black,
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
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.play_circle), label: "Anime"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.web_stories), label: "Explore"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ]);
          }
        },
      ),
      body: widget.child,
    );
  }
}

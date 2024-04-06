import 'package:flutter/material.dart';

import '../Screens_ui/History_screen.dart';
import '../Screens_ui/HomeScreen/Home_screen.dart';
import '../Screens_ui/Profile_screen.dart';
// import 'package:oneone/Screens_ui/HomeScreen/Home_screen.dart';


class Main_page extends StatefulWidget {
  const Main_page({super.key});

  @override
  State<Main_page> createState() => _My_pageState();
}

class _My_pageState extends State<Main_page> {
  List pages = [Home_screen(), Profile_screen(), History_screen(),];

  int current_index = 0;

  void onTap(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: pages[current_index],
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          //to get rid of the written text
          selectedFontSize: 12,
          unselectedFontSize: 12,
        
          // default is ...type.shifting so its default color is white
          //if you want to change the color of the nav -- change type to fixed
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(205, 232, 237, 1),
        
          onTap: onTap,
          currentIndex: current_index,
        
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
        
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps , size: 0,)),
            BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.bar_chart_sharp, size: 0,)),
            BottomNavigationBarItem(label: "History", icon: Icon(Icons.search, size: 0,)),
            
          ],
        ),
      ),
    );
  }
}
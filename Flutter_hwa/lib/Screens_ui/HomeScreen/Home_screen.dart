import 'package:flutter/material.dart';
import 'package:oneone/Screens_ui/HomeScreen/card_knowMore.dart';
import 'package:oneone/Screens_ui/Profile_sreen/Profile_screen.dart';
import 'package:oneone/Widgets_code/cardview.dart';
import 'package:oneone/Widgets_code/corousel.dart';

import '../settings.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grapho Insights',
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Menu icon pressed');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => settings()),
              );
              print('Account circle icon pressed');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // COROUSEL
            Container(
              height: 250,
              child: CarouselExample(),
            ),

            SizedBox(
              height: 10,
            ),

            // CARD VIEW
            Container(
              height: 300,
              child: StackedCard(),
            ),

            Container(height: 140, child: knowMore_card()),

            SizedBox(
              height: 10,
            ),

            //BOTTOM NAV BUTTON
            // Container(height: 50, child: SegmentedButtonBar()),
          ],
        ),
      ),
    );
  }
}

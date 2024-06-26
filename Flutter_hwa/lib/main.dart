import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneone/Screens_ui/HomeScreen/Home_screen.dart';
import 'package:oneone/bottom_nav/bottom_nav_container.dart';
import 'package:oneone/firebase_options.dart';

import 'Screens_ui/Analysis_screen.dart';
import 'Screens_ui/Flash screen/flash_screen.dart';

// import 'package:ui_skeleton/listview.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grapho Insights',
      theme: ThemeData(
        colorSchemeSeed: Color.fromRGBO(0, 119, 182, 1.0),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black), // Set your text color here
          bodyText2:
              TextStyle(color: Colors.black), // You can customize more styles
          // Add other text styles as needed
        ),
      ),
      // home: HomeScreen(),
      //  home: view_list(),
      //home : CarouselExample(),
      // home: History_screen(),
      // home: Home_screen(),
      // home : Main_page(),
      home: InitialScreen(),
    );
  }
}

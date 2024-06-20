import 'package:flutter/material.dart';

import '../../bottom_nav/bottom_nav_container.dart';
import '../signup_login screens/signup_direct_screen.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Main_page after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/caligraphyicon.png',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}


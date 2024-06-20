import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 24),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     print('Menu icon pressed');
        //   },
        // ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.settings_outlined),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => Profile_screen()),
        //       );
        //       print('Account circle icon pressed');
        //     },
        //   ),
        // ],
      ),
      body: Container(color: Colors.white, child: Text(''), ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:oneone/Screens_ui/Profile_screen.dart';
import 'package:oneone/Screens_ui/knowmore_screen/widgets_KNOWMORE/card_screen_know.dart';

class knowmore_screen extends StatelessWidget {
  const knowmore_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 50,
        title: Text(
          'Grapho Insights',
          style: TextStyle(fontSize: 24),
        ),

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Add your menu icon functionality here
            Navigator.pop(context);
            print('Menu icon pressed');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              // Add your account circle icon functionality here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile_screen()),
              );
              print('Account circle icon pressed');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(child: card_knowmore_screen())
        ],
      ),
    );
  }
}

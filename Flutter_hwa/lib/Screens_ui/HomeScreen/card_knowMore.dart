import 'package:flutter/material.dart';
import 'package:oneone/Screens_ui/knowmore_screen/knowmore_screen.dart';


class knowMore_card extends StatelessWidget {
  const knowMore_card({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Container(
            // color: Color.fromRGBO(3, 4, 94, 1),
            height: 250.0,
            child: Card(
              color: Color.fromRGBO(144, 224, 239, 1),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Graphology\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text('The science behind it.')
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            bottom: 30.0,
            right: 16.0,
            child: ElevatedButton(
              //style: ButtonStyle( ),
              onPressed: () {
                // Add your button's functionality here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => knowmore_screen()),
                );

                print('Button pressed');
              },
              child: Text(
                'Know More',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

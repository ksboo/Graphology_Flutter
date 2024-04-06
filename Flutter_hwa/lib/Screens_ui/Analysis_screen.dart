import 'package:flutter/material.dart';
import 'package:oneone/Screens_ui/History_screen.dart';
import 'package:oneone/Screens_ui/Profile_screen.dart';

//import 'package:ui_skeleton/Widgets_code/cardview.dart';

class Analysis_screen extends StatefulWidget {
  final String predictionResult;
  const Analysis_screen({Key? key, required this.predictionResult})
      : super(key: key);

  @override
  State<Analysis_screen> createState() => _Analysis_screenState();
}

class _Analysis_screenState extends State<Analysis_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 50,
        title: Text(
          'Analysis',
          style: TextStyle(fontSize: 24),
        ),
        //title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Add your menu icon functionality here
            Navigator.pop(context);
            print('back arrow pressed');
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
      body: Center(
        // Card view
        child: Stacked__Card(predictionResult: widget.predictionResult),
      ),
    );
  }
}

class Stacked__Card extends StatelessWidget {
    final String predictionResult;
 const Stacked__Card({Key? key, required this.predictionResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Container(
            height: 650.0,
            child: Card(
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
                      'Steve Jobs',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '15th December, 2023',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Results',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Great going',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 18.0),
                    // Text(
                    //   // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'
                    //   'Prediction Result: ${widget.predictionResult}',
                    //   style: TextStyle(
                    //     fontSize: 16.0,
                    //     fontFamily: 'Roboto',
                    //   ),
                    // ),
                   
                      Text('Prediction Result: $predictionResult',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                      ),
                    ),

                    Text(
                      '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 45.0,
            right: 16.0,
            child: ElevatedButton(
              //style: ButtonStyle( ),
              onPressed: () {
                // Add your button's functionality here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => History_screen()),
                );

                print('Button pressed');
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 45.0,
            right: 120.0,
            child: ElevatedButton(
              onPressed: () {
                // Add your button's functionality here
                print('Button pressed');
              },
              child: Text(
                'Share',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

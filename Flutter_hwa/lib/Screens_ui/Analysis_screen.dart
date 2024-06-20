import 'package:flutter/material.dart';
import 'package:oneone/Screens_ui/History_screen.dart';
import 'package:oneone/Screens_ui/Profile_sreen/Profile_screen.dart';
import 'package:intl/intl.dart';  // Import the intl package
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Analysis_screen extends StatefulWidget {
  final String predictionResult;

  const Analysis_screen({Key? key, required this.predictionResult}) : super(key: key);

  @override
  State<Analysis_screen> createState() => _Analysis_screenState();
}

class _Analysis_screenState extends State<Analysis_screen> {
  late User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();
      setState(() {
        _user = user;
        _userData = userDoc.data() as Map<String, dynamic>?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analysis',
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            print('back arrow pressed');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
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
        child: Stacked__Card(
          predictionResult: widget.predictionResult,
          userName: _userData?['name'] ?? 'N/A', // Pass userName to Stacked__Card
        ),
      ),
    );
  }
}

class Stacked__Card extends StatelessWidget {
  final String predictionResult;
  final String userName; // Add userName as a parameter

  const Stacked__Card({Key? key, required this.predictionResult, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current date
    final String currentDate = DateFormat('d MMMM, yyyy').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Container(
            height: 650.0,
            width: 350.0,  // Set a fixed width
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
                      userName, // Use the user's name here
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      currentDate, // Use the current date here
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
                    Text(
                      'Prediction Result: $predictionResult',
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
              onPressed: () {
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

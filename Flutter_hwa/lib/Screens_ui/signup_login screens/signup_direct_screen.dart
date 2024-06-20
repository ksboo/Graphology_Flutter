import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oneone/bottom_nav/bottom_nav_container.dart';

import 'widgets/carousel_signup.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _handleSignIn() async {
    try {
      // Sign in with Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Get Google Sign-In authentication
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        
        // Create Firebase credentials
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Get user information
        final User? user = userCredential.user;

        // Save user data to Firestore
        if (user != null) {
          await _firestore.collection('Users').doc(user.uid).set({
            'name': user.displayName,
            'email': user.email,
            'age': '21', // You can prompt the user for this later
            'analysis': {
              'analysis1': 'happy (cjhgk)',
              'analysis2': 'tired (cjhdvkj)',
              'analysis3': 'happy (dehxgajk)',
            },
            'gender': 'female', // You can prompt the user for this later
            'isGraphologist': false,
          });
        }

        // Navigate to next screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Main_page()),
        );
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grapho Insights',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: _handleSignIn,
              child: Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                side: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 90,),
          carousel_signup(),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Are you a graphologist? Register here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
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

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _handleSignIn() async {
    try {
      // Sign in with Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Get Google Sign-In authentication
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Create Firebase credentials
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Get user information
        final User? user = userCredential.user;

        // Save user data to Firestore
        if (user != null) {
          await _firestore.collection('Users').doc(user.uid).set({
            'name': user.displayName,
            'email': user.email,
            'age': '21', // You can prompt the user for this later
            'analysis': {
              'analysis1': 'happy (cjhgk)',
              'analysis2': 'tired (cjhdvkj)',
              'analysis3': 'happy (dehxgajk)',
            },
            'certification': 'cekdgigk.dexwgk',
            'gender': 'female', // You can prompt the user for this later
            'isGraphologist': true,
            'review': {
              'comment1': 'ckehdgkgb',
              'comment2': 'cdsggigcekd',
              'comment3': 'dekwucgdig',
            },
            'experience': 'kduegciugecwks iudgiug euiiuw u hweiohoiwhecoih',
            'ratings': {
              'rating1': '2',
              'rating2': '5',
            },
          });
        }

        // Navigate to next screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Main_page()),
        );
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(185, 232, 240, 1),
        title: Text('Register as Graphologist'),
      ),
      body: Column(
        children: [
          SizedBox(height: 70,),
          carousel_signup(),
          SizedBox(height: 40,),
          Center(
            child: ElevatedButton(
              onPressed: _handleSignIn,
              child: Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                side: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
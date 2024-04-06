import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  late User? _user;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 50,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 24),
        ),
        //title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            // Add your menu icon functionality here
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
            height: 10,
          ),
          Container(
            height: 400,
            child: Center(
              child: ClipOval(
                child: _user != null && _user!.photoURL != null
                    ? Image.network(
                        _user!.photoURL!,
                        width: 400,
                        height: 400,
                        fit: BoxFit.cover,
                      )
                    : Placeholder(),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${_user?.displayName ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Email id: ${_user?.email ?? 'N/A'}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Age :  35',
                textAlign: TextAlign.left,
              ),
              Text(
                'Gender :  Female',
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

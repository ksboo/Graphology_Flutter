import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'profile_card.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({Key? key}) : super(key: key);

  @override
  State<Profile_screen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profile_screen> {
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
    bool isGraphologist = _userData?['isGraphologist'] ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromRGBO(215, 237, 240, 1),
      ),
      body: SingleChildScrollView(
        child: _userData == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    color: Color.fromRGBO(215, 237, 240, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: _user != null && _user!.photoURL != null
                              ? NetworkImage(_user!.photoURL!)
                              : AssetImage('assets/default_profile_image.png') as ImageProvider,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          _userData?['name'] ?? 'N/A',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          isGraphologist ? 'Graphologist' : 'User',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.email_outlined, color: Colors.black),
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Email: ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: _userData?['email'] ?? 'N/A',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today_outlined, color: Colors.black),
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Age: ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: _userData?['age'] ?? 'N/A',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outline, color: Colors.black),
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Gender: ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: _userData?['gender'] ?? 'N/A',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isGraphologist) ...[
                    ListTile(
                      leading: Icon(Icons.work_outline, color: Colors.black),
                      title: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Experience: ',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            TextSpan(
                              text: _userData?['experience'] ?? 'N/A',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.star_outline, color: Colors.black),
                      title: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Ratings: ',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            TextSpan(
                              text: _userData?['ratings'].toString() ?? 'N/A',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.comment_outlined, color: Colors.black),
                      title: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Reviews: ',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            TextSpan(
                              text: _userData?['review'].toString() ?? 'N/A',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: 15),

                  Center(child: Container(height: 250, child: ProfileCard(isGraphologist: isGraphologist,),))
                ],
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oneone/Screens_ui/Profile_sreen/Profile_screen.dart';
import 'package:oneone/Screens_ui/settings.dart';

class History_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current user's ID from Firebase Authentication
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Menu icon pressed');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => settings()),
              );
              print('Account circle icon pressed');
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').doc(userId).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(child: Text('No data available'));
          }
          var userData = snapshot.data!.data() as Map<String, dynamic>;
          var analysisData = userData['analysis'] as Map<String, dynamic>;
          var analysisEntries = analysisData.entries.toList();
          return ListView.builder(
            itemCount: analysisEntries.length,
            itemBuilder: (context, index) {
              var entry = analysisEntries[index];
              return MaterialListItem(
                title: entry.key,
                subtitle: entry.value,
                prefixIcon: Icons.person_2_outlined,
              );
            },
          );
        },
      ),
    );
  }
}

class MaterialListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData prefixIcon;

  MaterialListItem({
    required this.title,
    required this.subtitle,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      //color: Theme.of(context).primaryColor,
      child: ListTile(
        tileColor: Color.fromRGBO(215, 237, 240, 1),
        leading: Icon(prefixIcon),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

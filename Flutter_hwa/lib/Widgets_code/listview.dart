import 'package:flutter/material.dart';

class view_list extends StatefulWidget {
  const view_list({super.key});

  @override
  State<view_list> createState() => _view_listState();
}

class _view_listState extends State<view_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('List Item Example'),
      ),
      body: ListView(
        children : [ MaterialListItem(
          title: 'Title Text',
          subtitle: 'Supporting line text lorem ipsum dolor sit amet, consectetur.',
          prefixIcon: Icons.person_2_outlined,
        ),
        ],
      ),
    );

    // return Scaffold(
    //   body: Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'History',
    //           style: TextStyle(
    //             fontSize: 24.0,
    //             fontWeight: FontWeight.bold,
    //             fontFamily: 'Roboto',
    //           ),
    //         ),
    //         SizedBox(height: 18,),

    //       ],
    //     ),
    //   ),
    // );
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
      color: Theme.of(context).primaryColorLight,
      child: ListTile(
        leading: Icon(prefixIcon),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.0, // M3/body/large
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0, // M3/body/medium
          ),
        ),
      ),
    );
  }
}


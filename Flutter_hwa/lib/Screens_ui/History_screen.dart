import 'package:flutter/material.dart';
import 'package:oneone/Screens_ui/Profile_screen.dart';

import 'settings.dart';


class History_screen extends StatefulWidget {
  const History_screen({super.key});

  @override
  State<History_screen> createState() => _History_screenState();
}

class _History_screenState extends State<History_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Grapho Insights'),
        title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
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
              MaterialPageRoute(builder: (context) => settings()),
            );

              print('Account circle icon pressed');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
          SizedBox(
            height: 5,
          ),
          MaterialListItem(
            title: 'Title Text',
            subtitle:
                'Supporting line text lorem ipsum dolor sit amet, consectetur.',
            prefixIcon: Icons.person_2_outlined,
          ),
        ],
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

    // Access the color scheme from the current theme
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // Use the primary color for even indices and the surface color for odd indices
    Color itemColor =  colorScheme.primary;

   
    return Container(
      height: 88,
      color: Theme.of(context).primaryColorLight,
      child: ListTile(
        tileColor: Colors.purpleAccent,
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

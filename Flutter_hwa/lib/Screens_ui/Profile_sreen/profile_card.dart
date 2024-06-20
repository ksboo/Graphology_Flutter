import 'package:flutter/material.dart';

import '../../List_screen.dart';

class ProfileCard extends StatefulWidget {
  final bool isGraphologist;

  const ProfileCard({super.key, required this.isGraphologist});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Container(
            height: 150.0,
            child: Card(
              color: Color.fromRGBO(175, 235, 243, 1),
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
                      widget.isGraphologist ? 'Patients' : 'Consult',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      widget.isGraphologist
                          ? '\nView the list of all your patients. \t\t\t\t\t\t\t\t'
                          : '\nContact a graphologist for consultation. \t\t\t\t\t\t\t\t',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 38.0,
            right: 30.0,
            child: ElevatedButton(
              onPressed: () {
                //Add your button's functionality here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListScreen(isGraphologist : widget.isGraphologist,)),
                );

                print('Button pressed');
              },
              child: Text(
                widget.isGraphologist ? 'Patients' : 'Graphologists',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SegmentedButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SegmentedButton(
            text: 'Profile',
            isFirst: true,
          ),
          SegmentedButton(
            text: 'Home',
            isFirst: false,
          ),
          SegmentedButton(
            text: 'History',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class SegmentedButton extends StatelessWidget {
  final String text;
  final bool isFirst;
  final bool isLast;

  SegmentedButton({
    required this.text,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your button's functionality here
        print('$text button pressed');
      },
      style: ElevatedButton.styleFrom(
       // primary: Theme.of(context).primaryColor, // Background color for disabled buttons
       primary: Colors.white,
        onPrimary: Theme.of(context).primaryColorLight, // Text color for disabled buttons
        elevation: 10, //  elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: isFirst ? Radius.circular(20.0) : Radius.zero,
            right: isLast ? Radius.circular(20.0) : Radius.zero,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0), // Text color for enabled buttons
        ),
      ),
    );
  }
}
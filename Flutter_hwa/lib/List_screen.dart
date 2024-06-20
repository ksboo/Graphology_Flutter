import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  final bool isGraphologist;

  const ListScreen({Key? key, required this.isGraphologist}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> userList = ['User 1', 'User 2', 'User 3']; // Example user list
  List<String> graphologistList = ['Graphologist 1', 'Graphologist 2', 'Graphologist 3']; // Example graphologist list

  @override
  Widget build(BuildContext context) {
    List<String> displayList = widget.isGraphologist ? userList : graphologistList;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isGraphologist ? 'Users' : 'Graphologists'),
      ),
      body: ListView.builder(
        itemCount: displayList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // Placeholder for profile photo
              backgroundColor: Colors.grey, // You can replace this with actual profile photo
            ),
            title: Text(displayList[index]),
          );
        },
      ),
    );
  }
}

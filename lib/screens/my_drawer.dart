import 'package:final_todo/screens/recycle_bin.dart';
import 'package:final_todo/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Todo Drawer'),
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.folder_special),
              title: const Text('Tasks Screen'),
              onTap: () {
                Navigator.of(context).pushNamed(TasksScreen.id);
              },
            ),
          ),
          Divider(),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.delete),
              title: const Text('Recycle Bin'),
              onTap: () {
                 Navigator.of(context).pushNamed(RecycleBin.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}

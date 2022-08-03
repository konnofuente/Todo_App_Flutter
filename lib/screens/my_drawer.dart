import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:final_todo/blocs/bloc/tasks_bloc.dart';
import 'package:final_todo/blocs/bloc/tasks_state.dart';
import 'package:final_todo/blocs/block_export.dart';
import 'package:final_todo/screens/recycle_bin.dart';
import 'package:final_todo/screens/sign_in.dart';
import 'package:final_todo/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
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
            BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed(TasksScreen.id);
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new TasksScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.folder_special),
                  title: const Text('Tasks Screen'),
                  trailing: Text('${state.allTasks.length}'),
                ),
              );
            }),
            Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: const Text('Recycle Bin'),
                    trailing: Text('${state.allRemove.length}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new RecycleBin(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            GestureDetector(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Log out'),
                onTap: () async {
                  await Amplify.Auth.signOut();
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new SignIn(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

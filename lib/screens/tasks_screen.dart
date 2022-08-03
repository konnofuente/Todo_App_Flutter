// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:final_todo/blocs/bloc/tasks_state.dart';
import 'package:final_todo/models/TODO.dart';
import 'package:final_todo/screens/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/block_export.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen())));
  }

  @override
  Widget build(BuildContext context) {
    int complete = 0;
    int notComplete = 0;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (complete + notComplete <= state.allTasks.length) {
          complete = 0;
          notComplete = 0;
        }
        for (var element in state.allTasks) {
          element.isComplete ? complete++ : notComplete++;
        }

        List<TODO> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {
                  _addTask(context);
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    'You Have ${state.allTasks.length} Task',
                  ),
                  backgroundColor: Color.fromARGB(121, 5, 166, 246),
                ),
              ),
              Text(
                'Completed : ${complete} ',
                style: TextStyle(
                    color: Colors.green[400],
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    height: 1,
                    fontSize: 15),
              ),
              Text(
                ' NotComplete : ${notComplete} ',
                style: TextStyle(
                    color: Colors.red[400],
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    height: 1,
                    fontSize: 15),
              ),
              TasksList(tasksList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

//widget that enable us to add a user information


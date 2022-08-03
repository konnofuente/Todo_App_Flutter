import 'package:final_todo/models/TODO.dart';
import 'package:final_todo/widgets/task_tile.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc/tasks_event.dart';
import '../blocs/bloc/tasks_state.dart';
import '../blocs/block_export.dart';


class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TODO> tasksList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              itemCount: tasksList.length,
              itemBuilder: ((context, index) {
                var task = tasksList[index];
                return TaskTile(task: task);
              })),
        );
      },
    );
  }
}

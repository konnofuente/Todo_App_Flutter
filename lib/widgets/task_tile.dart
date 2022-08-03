import 'package:final_todo/blocs/bloc/tasks_event.dart';
import 'package:flutter/material.dart';

import '../blocs/block_export.dart';
import '../models/TODO.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TODO task;

  void _RemoveOrDeleteTask(BuildContext ctx, TODO task) {
    task.isRemove
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name!,
        style: TextStyle(
            decoration: task.isComplete ? TextDecoration.lineThrough : null,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      trailing: Checkbox(
        value: task.isComplete,
        onChanged: task.isRemove == false ?
         (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        }
        : null,
      ),
      onLongPress: () => {
        _RemoveOrDeleteTask(context, task),
      },
    );
  }
}

import 'package:final_todo/blocs/block_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/TODO.dart';
import '../widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = './recycle_bin.dart';

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TODO> tasksList = state.allRemove;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          // drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [TasksList(tasksList: tasksList)],
          ),
        );
      },
    );
  }
}

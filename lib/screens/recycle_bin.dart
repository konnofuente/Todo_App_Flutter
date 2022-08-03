import 'package:flutter/material.dart';

import '../models/TODO.dart';
import '../widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

    static const id = 'recycle_bin_screen';

  
  @override
  Widget build(BuildContext context) {
    List<TODO> tasksList = [];
    return Scaffold(
          appBar: AppBar(
            title: const Text('TRecycle Bin'),
            actions: [
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
          // drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TasksList(tasksList: tasksList)
            ],
          ),
        );
  }
}

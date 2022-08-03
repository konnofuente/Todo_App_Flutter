

import 'package:equatable/equatable.dart';

import '../../models/TODO.dart';

class TasksState extends Equatable {
  final List<TODO> allTasks; 
  final List<TODO> allRemove; 
  const TasksState(
    {
      this.allTasks = const<TODO> [],
      this.allRemove = const<TODO> [],
    }
  );

  @override
  List<Object> get props => [allTasks,allRemove];
}

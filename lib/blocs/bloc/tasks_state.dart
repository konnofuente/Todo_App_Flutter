

import 'package:equatable/equatable.dart';

import '../../models/TODO.dart';

class TasksState extends Equatable {
  final List<TODO> allTasks; 
  const TasksState(
    {
      this.allTasks = const<TODO> [],
    }
  );

  @override
  List<Object> get props => [allTasks];
}

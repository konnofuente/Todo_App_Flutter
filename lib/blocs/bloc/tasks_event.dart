// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../models/TODO.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final TODO task;
  AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final TODO task;
  UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final TODO task;
  DeleteTask({
    required this.task,
  });
}

class RemoveTask extends TasksEvent {
  final TODO task;
  RemoveTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

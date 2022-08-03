import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:final_todo/amplifyconfiguration.dart';
import 'package:final_todo/blocs/bloc/tasks_event.dart';
import 'package:final_todo/blocs/bloc/tasks_state.dart';
import 'package:final_todo/models/ModelProvider.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  late StreamSubscription<QuerySnapshot<TODO>> _subscription;
  final _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();

  @override
  void initState() {
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([_dataStorePlugin]);

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }
  }

  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  Future<FutureOr<void>> _onAddTask(
      AddTask event, Emitter<TasksState> emit) async {
    final state = this.state;
    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
      allRemove: List.from(state.allRemove),
    ));

    var newTodo = TODO(
      name: event.task.name,
      description: event.task.description,
      isComplete: false,
      isRemove: false,
    );
    try {
      //to write in store we pass an instance of the model
      await Amplify.DataStore.save(newTodo);
      print('Succesfully save!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('An error occurred while saving Todo: $e');
    }
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final index = state.allTasks.indexOf(task);
    List<TODO> allTasks = List.from(state.allTasks)..remove(task);
    task.isComplete == false
        ? allTasks.insert(index, task.copyWith(isComplete: true))
        : allTasks.insert(index, task.copyWith(isComplete: false));

    emit(TasksState(
      allTasks: allTasks,
      allRemove: state.allRemove,
      
      ));
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final index = state.allTasks.indexOf(task);

    List<TODO> allTasks = List.from(state.allTasks)..remove(task);
    emit(TasksState(allTasks: allTasks));
  }

  FutureOr<void> _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    
   
    emit(TasksState(
     allTasks : List.from(state.allTasks)..remove(task),
     allRemove : List.from(state.allRemove)..add(event.task.copyWith(isRemove:true)),
    
    ));
  }
}

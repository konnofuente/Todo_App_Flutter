import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:final_todo/amplifyconfiguration.dart';
import 'package:final_todo/services/app_router.dart';
import 'package:final_todo/screens/sign_in.dart';
import 'package:flutter/material.dart';

import 'blocs/bloc/tasks_event.dart';
import 'blocs/block_export.dart';
import 'models/ModelProvider.dart';
import 'screens/tasks_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, }) : super(key: key);
  // final AppRouter appRouter;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  final _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();

  @override
  void initState() {
    _initializeApp();
    super.initState();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();
    print('initialisation complete !!!!!!!!!!!!!!!!!!!!!!!!!!!1111');

    // after configuring Amplify, update loading ui state to loaded state
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // add Amplify plugins
       final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);
      await Amplify.addPlugins([_dataStorePlugin]);
      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
      print('successfull configuration');
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print(
          'An error occurred while configuring Amplify error in configuration!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11: $e');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(AddTask(
            task: TODO(
                id: '1',
                name: 'todo',
                description: 'make sure',
                isComplete: false))),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignIn(), 
      ),
    );
  }
}

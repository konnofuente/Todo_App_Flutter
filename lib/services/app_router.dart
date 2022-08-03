import 'package:final_todo/screens/recycle_bin.dart';
import 'package:final_todo/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => TasksScreen());
      default:
        return null;
    }
  }
}

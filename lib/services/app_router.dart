import 'package:flutter/material.dart';
import 'package:notes_app/screen/recycle_bin.dart';
import 'package:notes_app/screen/task_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => const TasksScreen());
      default:
        return null;
    }
  }
}

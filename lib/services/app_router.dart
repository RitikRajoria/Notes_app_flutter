import 'package:flutter/material.dart';
import 'package:notes_app/screen/recycle_bin.dart';
import 'package:notes_app/screen/tabs_screen.dart';
import 'package:notes_app/screen/pending_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => TabsScreen());
      default:
        return null;
    }
  }
}

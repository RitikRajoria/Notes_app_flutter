import 'package:flutter/material.dart';
import 'package:notes_app/screen/add_task_screen.dart';
import 'package:notes_app/screen/completed_tasks_screen.dart';
import 'package:notes_app/screen/favorite_tasks_screen.dart';
import 'package:notes_app/screen/my_drawer.dart';
import 'package:notes_app/screen/pending_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingTasks(), 'title': 'Pending Tasks'},
    {'pageName': CompletedTasks(), 'title': 'Completed Tasks'},
    {'pageName': favoriteTasks(), 'title': 'Favorites Tasks'},
  ];

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskScreen(),
        ),
      ),
    );
  }

  var _selectedPagesIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPagesIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_selectedPagesIndex]['pageName'],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPagesIndex,
        onTap: (index) {
          setState(() {
            _selectedPagesIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pending Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite Tasks',
          ),
        ],
      ),
    );
  }
}

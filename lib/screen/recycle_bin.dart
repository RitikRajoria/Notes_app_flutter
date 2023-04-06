import 'package:flutter/material.dart';
import 'package:notes_app/screen/my_drawer.dart';
import 'package:notes_app/widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                ' Tasks',
              ),
            ),
          ),
          Expanded(
            child: TasksList(tasksList: []),
          ),
        ],
      ),
    );
  }
}

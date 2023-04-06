import 'package:flutter/material.dart';
import 'package:notes_app/bloc/bloc_exports.dart';
import 'package:notes_app/screen/recycle_bin.dart';
import 'package:notes_app/screen/task_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text('Task Drawer',
                  style: Theme.of(context).textTheme.headline5),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(TasksScreen.id),
                  child: ListTile(
                    leading: Icon(Icons.folder_special),
                    title: Text('My Tasks'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text('Bin'),
                trailing: Text('0'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

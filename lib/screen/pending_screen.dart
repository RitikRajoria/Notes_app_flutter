import 'package:flutter/material.dart';
import 'package:notes_app/bloc/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class PendingTasks extends StatelessWidget {
  const PendingTasks({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.allTasks.length} Tasks',
                ),
              ),
            ),
            Expanded(
              child: TasksList(tasksList: tasksList),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../models/task.dart';
import '../bloc/bloc_exports.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasksList.length,
      itemBuilder: ((context, index) {
        var task = tasksList[index];
        return ListTile(
          title: Text(task.title),
          trailing: Checkbox(
            onChanged: (value) {
              context.read<TasksBloc>().add(UpdateTask(task: task));
            },
            value: task.isDone,
          ),
          onLongPress: () =>
              context.read<TasksBloc>().add(DeleteTask(task: task)),
        );
      }),
    );
  }
}

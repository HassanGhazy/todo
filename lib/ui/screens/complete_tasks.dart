import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_statemanagment/providers/todo_provider.dart';
import 'package:todo_statemanagment/ui/widgets/task_widget.dart';

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TodoProvider>(context).completeTasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(
            Provider.of<TodoProvider>(context).completeTasks[index],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_statemanagment/providers/todo_provider.dart';
// import 'package:todo_statemanagment/screens/CompleteTasks.dart';
import 'package:todo_statemanagment/ui/screens/all_tasks.dart';
import 'package:todo_statemanagment/ui/screens/complete_tasks.dart';
import 'package:todo_statemanagment/ui/screens/incomplete_tasks.dart';
import 'package:todo_statemanagment/ui/screens/new_task_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NewTaskPage();
                  }));
                },
                icon: Icon(Icons.add))
          ],
          title: Text('Todo App'),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'All Tasks',
            ),
            Tab(
              text: 'Complete Tasks',
            ),
            Tab(
              text: 'InComplete Tasks',
            ),
          ]),
        ),
        body: Provider.of<TodoProvider>(context).allTasks == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(children: [
                AllTasks(),
                CompleteTasks(),
                InCompleteTasks(),
              ]),
      ),
    );
  }
}

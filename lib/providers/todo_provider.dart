import 'package:flutter/material.dart';
import 'package:todo_statemanagment/helpers/db_helper.dart';
import 'package:todo_statemanagment/models/task_model.dart';

class TodoProvider extends ChangeNotifier {
  TodoProvider() {
    getAllTasks();
  }
  List<TaskModel> allTasks = [];
  List<TaskModel> completeTasks = [];
  List<TaskModel> inCompleteTasks = [];
  String testName = 'shaker ahmed ali';
  changeTestName(String newName) {
    this.testName = newName;
    notifyListeners();
  }

  getAllTasks() async {
    this.allTasks = await DbHelper.dbHelper.getAllTasks();

    notifyListeners();
  }

  insertTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.createNewTask(taskModel);
    getAllTasks();
  }

  deleteTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.deleteTask(taskModel);
    getAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.updateTask(taskModel);
    getAllTasks();
  }
}

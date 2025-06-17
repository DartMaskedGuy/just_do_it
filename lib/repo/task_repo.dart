import 'dart:convert';
import 'package:do_it/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {
  final SharedPreferences _prefs;
  static const String _tasksKey = 'tasks_key';

  TaskRepository(this._prefs);

  Future<bool> addTask(TaskModel task) async {
    try {
      final tasks = await getTasks();
      tasks.add(task);
      final tasksJson = tasks.map((task) => task.toJson()).toList();
      await _prefs.setString(_tasksKey, jsonEncode(tasksJson));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<TaskModel>> getTasks() async {
    try {
      final tasksJson = _prefs.getString(_tasksKey);
      if (tasksJson != null) {
        final List<dynamic> decoded = jsonDecode(tasksJson);
        return decoded.map((task) => TaskModel.fromJson(task)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}

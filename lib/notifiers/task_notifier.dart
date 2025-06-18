import 'dart:convert';
import 'package:do_it/models/task_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tasksProvider = StateNotifierProvider<TaskNotifier, List<TaskModel>>((
  ref,
) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]) {
    _loadTasks();
  }

  static const String _storageKey = 'tasks';

  /// Load tasks from SharedPreferences
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString(_storageKey);
    if (tasksJson != null) {
      final List<dynamic> decoded = jsonDecode(tasksJson);
      state = decoded.map((json) => TaskModel.fromJson(json)).toList();
    }
  }

  /// Create a new task
  Future<bool> addTask(TaskModel task) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final newState = [...state, task];
      final encoded = jsonEncode(newState.map((t) => t.toJson()).toList());
      await prefs.setString(_storageKey, encoded);
      state = newState;
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Edit an existing task
  Future<bool> editTask(String taskId, TaskModel updatedTask) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final taskIndex = state.indexWhere((task) => task.id == taskId);

      if (taskIndex != -1) {
        final newState = [...state];
        newState[taskIndex] = updatedTask;

        final encoded = jsonEncode(newState.map((t) => t.toJson()).toList());
        await prefs.setString(_storageKey, encoded);
        state = newState;
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Delete all tasks
  Future<bool> deleteAllTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_storageKey);
      state = [];
      return true;
    } catch (e) {
      return false;
    }
  }
}

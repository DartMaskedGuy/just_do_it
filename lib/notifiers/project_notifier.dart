import 'dart:convert';
import 'package:do_it/models/project_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final projectsProvider =
    StateNotifierProvider<ProjectNotifier, List<ProjectModel>>((ref) {
      return ProjectNotifier();
    });

class ProjectNotifier extends StateNotifier<List<ProjectModel>> {
  ProjectNotifier() : super([]) {
    _loadProjects();
  }

  static const String _storageKey = 'projects';

  Future<void> _loadProjects() async {
    final prefs = await SharedPreferences.getInstance();
    final projectsJson = prefs.getString(_storageKey);
    if (projectsJson != null) {
      final List<dynamic> decoded = jsonDecode(projectsJson);
      state = decoded.map((json) => ProjectModel.fromJson(json)).toList();
    }
  }

  Future<bool> createProject(ProjectModel project) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final newState = [...state, project];
      final encoded = jsonEncode(newState.map((p) => p.toJson()).toList());
      await prefs.setString(_storageKey, encoded);
      state = newState;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteProject(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final newState = state.where((p) => p.id != id).toList();
      final encoded = jsonEncode(newState.map((p) => p.toJson()).toList());
      await prefs.setString(_storageKey, encoded);
      state = newState;
      return true;
    } catch (e) {
      return false;
    }
  }
}

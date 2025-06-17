import 'dart:convert';

import 'package:do_it/models/project_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectRepository {
  final SharedPreferences _prefs;
  static const String _projectsKey = 'projects_key';

  ProjectRepository(this._prefs);

  Future<bool> createProject(ProjectModel project) async {
    try {
      final projects = await getProjects();
      projects.add(project);
      final projectsJson = projects.map((project) => project.toJson()).toList();
      await _prefs.setString(_projectsKey, jsonEncode(projectsJson));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ProjectModel>> getProjects() async {
    try {
      final projectsJson = _prefs.getString(_projectsKey);
      if (projectsJson != null) {
        final List<dynamic> decoded = jsonDecode(projectsJson);
        return decoded
            .map((project) => ProjectModel.fromJson(project))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}

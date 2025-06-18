import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String name;
  final DateTime createdDate;
  final DateTime endDate;
  final List<String> assignedTo;
  final List<String> tags;
  final String comments;
  final bool isCompleted;
  final double? progress;

  TaskModel({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.endDate,
    required this.assignedTo,
    required this.tags,
    required this.comments,
    this.isCompleted = false,
    this.progress,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdDate': createdDate.toIso8601String(),
    'endDate': endDate.toIso8601String(),
    'assignedTo': assignedTo,
    'tags': tags,
    'comments': comments,
    'progress': progress,
  };

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json['id'],
    name: json['name'],
    createdDate: DateTime.parse(json['createdDate']),
    endDate: DateTime.parse(json['endDate']),
    assignedTo: List<String>.from(json['assignedTo']),
    tags: List<String>.from(json['tags']),
    comments: json['comments'],
    progress: json['progress'],
  );
}

// class TaskModel {
//   final String id;
//   final String name;
//   final DateTime createdDate;
//   final DateTime endDate;
//   final List<String> assignedTo;
//   final List<String> tags;
//   final String comments;
//   final bool isCompleted;

//   TaskModel({
//     required this.id,
//     required this.name,
//     required this.createdDate,
//     required this.endDate,
//     required this.assignedTo,
//     required this.tags,
//     required this.comments,
//     this.isCompleted = false,
//   });

//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'createdDate': createdDate.toIso8601String(),
//     'endDate': endDate.toIso8601String(),
//     'assignedTo': assignedTo,
//     'tags': tags,
//     'comments': comments,
//   };

//   factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
//     id: json['id'],
//     name: json['name'],
//     createdDate: DateTime.parse(json['createdDate']),
//     endDate: DateTime.parse(json['endDate']),
//     assignedTo: List<String>.from(json['assignedTo']),
//     tags: List<String>.from(json['tags']),
//     comments: json['comments'],
//   );
// }

// Tag Data
class TagData {
  final String name;
  final Color bgColor;
  final Color textColor;

  TagData({required this.name, required this.bgColor, required this.textColor});
}

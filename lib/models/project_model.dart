class ProjectModel {
  final String id;
  final String name;
  final DateTime createdDate;
  final DateTime endDate;
  final List<String> teamMembers;
  final List<String> tags;
  final String description;

  ProjectModel({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.endDate,
    required this.teamMembers,
    required this.tags,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdDate': createdDate.toIso8601String(),
    'endDate': endDate.toIso8601String(),
    'teamMembers': teamMembers,
    'tags': tags,
    'description': description,
  };

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    id: json['id'],
    name: json['name'],
    createdDate: DateTime.parse(json['createdDate']),
    endDate: DateTime.parse(json['endDate']),
    teamMembers: List<String>.from(json['teamMembers']),
    tags: List<String>.from(json['tags']),
    description: json['description'],
  );
}

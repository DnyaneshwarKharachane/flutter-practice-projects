class ToDoModel {
  int? id;
  String title;
  String description;
  String date;

  ToDoModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  // Convert a ToDoModel into a Map. The keys must match the DB columns.
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  // Create a ToDoModel from a DB map.
  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'] as int?,
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      date: map['date'] as String? ?? '',
    );
  }
}

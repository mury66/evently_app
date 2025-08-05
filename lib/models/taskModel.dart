class TaskModel {
  String id;
  String title;
  String description;
  String category;
  int date;
  int time;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.time,
  });

 TaskModel.fromJson(Map<String, dynamic> json)
     :this(
      id: json['id'] ?? '',
      title: json['title'],
      description: json['description'],
      category: json['category'],
      date: json['date'],
      time: json['time'],
    );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'date': date,
      'time': time,
    };
  }

}

import 'package:easy_localization/easy_localization.dart';

class TaskModel {
  String id;
  String userId;
  String title;
  String description;
  String category;
  int date;
  int time;
  bool isFav;

  String get monthAbbreviation {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    return DateFormat.MMM().format(dateTime);
  }
  String get dayAndMonth {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    return '${dateTime.day}\n${DateFormat.MMM().format(dateTime)}';
  }


  TaskModel({
    this.id = "",
    required this.userId,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.time,
    this.isFav = false,
  });

 TaskModel.fromJson(Map<String, dynamic> json)
     :this(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      date: json['date'],
      time: json['time'],
      isFav: json['isFav'] ?? false,
    );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'category': category,
      'date': date,
      'time': time,
      'isFav': isFav,
    };
  }

}

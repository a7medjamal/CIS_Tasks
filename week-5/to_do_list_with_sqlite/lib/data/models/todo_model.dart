import '../../domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({super.id, required super.title, super.dueDate});

  factory TodoModel.fromMap(Map<String, dynamic> map) => TodoModel(
    id: map['id'],
    title: map['title'],
    dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'dueDate': dueDate?.toIso8601String(),
  };
}

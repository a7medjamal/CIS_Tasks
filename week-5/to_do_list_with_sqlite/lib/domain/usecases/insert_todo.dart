import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class InsertTodo {
  final TodoRepository repository;

  InsertTodo(this.repository);

  Future<void> call(Todo todo) => repository.insertTodo(todo);
}

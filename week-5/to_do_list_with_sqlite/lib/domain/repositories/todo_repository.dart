import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAllTodos();
  Future<void> insertTodo(Todo todo);
}

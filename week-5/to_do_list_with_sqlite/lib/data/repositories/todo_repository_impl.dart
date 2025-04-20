import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_datasource.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDatasource datasource;

  TodoRepositoryImpl(this.datasource);

  @override
  Future<List<Todo>> getAllTodos() async {
    return await datasource.getTodos();
  }

  @override
  Future<void> insertTodo(Todo todo) async {
    await datasource.insertTodo(TodoModel(
      title: todo.title,
      dueDate: todo.dueDate,
    ));
  }
}

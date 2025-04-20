import 'package:flutter/material.dart';
import 'package:to_do_list_with_sqlite/data/datasources/todo_local_datasource.dart';
import 'package:to_do_list_with_sqlite/data/repositories/todo_repository_impl.dart';
import 'package:to_do_list_with_sqlite/domain/usecases/get_all_todos.dart';
import 'package:to_do_list_with_sqlite/domain/usecases/insert_todo.dart';
import 'package:to_do_list_with_sqlite/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});
  @override
  Widget build(BuildContext context) {
    final datasource = TodoLocalDatasource();
    final repository = TodoRepositoryImpl(datasource);
    final getAllTodos = GetAllTodos(repository);
    final insertTodo = InsertTodo(repository);
    return MaterialApp(
      home: HomePage(getAllTodos: getAllTodos, insertTodo: insertTodo),
      debugShowCheckedModeBanner: false,
    );
  }
}

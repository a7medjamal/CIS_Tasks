import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list_with_sqlite/data/datasources/todo_local_datasource.dart';
import 'package:to_do_list_with_sqlite/data/repositories/todo_repository_impl.dart';
import 'package:to_do_list_with_sqlite/domain/usecases/get_all_todos.dart';
import 'package:to_do_list_with_sqlite/domain/usecases/insert_todo.dart';
import 'package:to_do_list_with_sqlite/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final datasource = TodoLocalDatasource();
  final database = await datasource.database;
  final repository = TodoRepositoryImpl(datasource);
  final getAllTodos = GetAllTodos(repository);
  final insertTodo = InsertTodo(repository);

  runApp(
    ToDoApp(
      getAllTodos: getAllTodos,
      insertTodo: insertTodo,
      database: database,
    ),
  );
}

class ToDoApp extends StatelessWidget {
  final GetAllTodos getAllTodos;
  final InsertTodo insertTodo;
  final Database database;

  const ToDoApp({
    super.key,
    required this.getAllTodos,
    required this.insertTodo,
    required this.database,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        getAllTodos: getAllTodos,
        insertTodo: insertTodo,
        database: database,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

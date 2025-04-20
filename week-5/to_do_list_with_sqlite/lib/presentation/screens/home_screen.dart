import 'package:flutter/material.dart';
import 'package:to_do_list_with_sqlite/core/utils/date_utils.dart';
import 'package:to_do_list_with_sqlite/presentation/screens/widgets/add_todo_sheet.dart';
import 'package:to_do_list_with_sqlite/presentation/screens/widgets/todo_empty_state.dart';
import 'package:to_do_list_with_sqlite/presentation/screens/widgets/todo_list_view.dart';
import '../../domain/usecases/get_all_todos.dart';
import '../../domain/usecases/insert_todo.dart';
import '../../domain/entities/todo.dart';

class HomePage extends StatelessWidget {
  final GetAllTodos getAllTodos;
  final InsertTodo insertTodo;

  const HomePage({
    super.key,
    required this.getAllTodos,
    required this.insertTodo,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 135,
        backgroundColor: Colors.blue,
        title: _buildHeader(now),
      ),
      body: FutureBuilder<List<Todo>>(
        future: getAllTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const TodoEmptyState();
          }
          return TodoListView(todos: snapshot.data!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.blue,
        onPressed: () => showAddTodoSheet(context, insertTodo),
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader(DateTime now) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.menu, size: 30, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Tasker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Text(
              now.day.toString(),
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            Column(
              children: [
                Text(
                  getMonthAbbreviation(now.month),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  now.year.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              getWeekdayName(now.weekday),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

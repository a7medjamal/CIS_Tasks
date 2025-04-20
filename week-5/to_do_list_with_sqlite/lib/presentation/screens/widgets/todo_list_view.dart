import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../domain/entities/todo.dart';

class TodoListView extends StatefulWidget {
  final List<Todo> todos;
  final Database database;

  const TodoListView({super.key, required this.todos, required this.database});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  late List<Todo> _todos;

  @override
  void initState() {
    super.initState();
    _todos = List.from(widget.todos);
  }

  Future<void> _deleteTodo(Todo todo) async {
    await widget.database.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [todo.id],
    );

    setState(() {
      _todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (_, index) {
        final todo = _todos[index];
        return Column(
          children: [
            ListTile(
              leading: GestureDetector(
                onTap: () => {_deleteTodo(todo)},
                child: Transform.scale(
                  scale: 1.5,
                  child: Icon(Icons.check_circle_outline, color: Colors.blue),
                ),
              ),
              title: Text(todo.title),
              subtitle: _buildDueDateText(todo.dueDate),
            ),
            const Divider(height: 1),
          ],
        );
      },
    );
  }

  Widget _buildDueDateText(DateTime? dueDate) {
    if (dueDate == null) return const Text('No due date');
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dueDay = DateTime(dueDate.year, dueDate.month, dueDate.day);
    final difference = dueDay.difference(today).inDays;

    if (difference == 0) {
      return const Text('Due today', style: TextStyle(color: Colors.red));
    } else if (difference > 0) {
      return Text('Due in $difference day(s)');
    } else {
      return const Text('Overdue', style: TextStyle(color: Colors.red));
    }
  }
}

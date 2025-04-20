import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../domain/entities/todo.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todos;

  const TodoListView({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, index) {
        final todo = todos[index];
        return Column(
          children: [
            ListTile(
              leading: Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  fillColor: MaterialStateProperty.all(Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  value: false,
                  onChanged: (value) {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      deleteDatabase(todo.id.toString());
                    });
                  },
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

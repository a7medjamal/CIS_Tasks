import 'package:flutter/material.dart';

class TodoEmptyState extends StatelessWidget {
  const TodoEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Add option to add due date',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        Expanded(
          child: Center(child: Icon(Icons.list, size: 64, color: Colors.grey)),
        ),
      ],
    );
  }
}

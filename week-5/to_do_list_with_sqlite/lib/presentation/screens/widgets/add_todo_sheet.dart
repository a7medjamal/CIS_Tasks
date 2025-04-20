import 'package:flutter/material.dart';
import '../../../domain/entities/todo.dart';
import '../../../domain/usecases/insert_todo.dart';

void showAddTodoSheet(BuildContext context, InsertTodo insertTodo) {
  final titleController = TextEditingController();
  DateTime? pickedDate;

  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add option to add due date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                focusColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelText: 'Task Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: const Size(200, 40),
              ),
              onPressed: () async {
                pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Colors.blue,
                        colorScheme: const ColorScheme.light(
                          primary: Colors.blue,
                        ),
                        buttonTheme: const ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
              },
              child: const Text(
                "Pick Due Date",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    if (titleController.text.isNotEmpty) {
                      await insertTodo(
                        Todo(title: titleController.text, dueDate: pickedDate),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

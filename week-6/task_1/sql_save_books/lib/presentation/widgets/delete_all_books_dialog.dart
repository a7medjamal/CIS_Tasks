import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/book_cubit.dart';

class DeleteAllBooksDialog extends StatelessWidget {
  const DeleteAllBooksDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookCubit>();

    return AlertDialog(
      title: const Text('Delete All Books'),
      content: const Text(
        'Are you sure you want to delete all books? This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            cubit.clearAllBooks();
            Navigator.pop(context);
          },
          child: const Text('Yes', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

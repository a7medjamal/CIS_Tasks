import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book.dart';
import '../cubit/book_cubit.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('Author: ${book.author}'),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.grey),
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text('Delete Book'),
                  content: Text('Are you sure you want to delete this book?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close dialog first
                        context.read<BookCubit>().deleteBookByTitle(book.title);
                      },
                      child: Text('Yes', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
          );
        },
      ),
    );
  }
}

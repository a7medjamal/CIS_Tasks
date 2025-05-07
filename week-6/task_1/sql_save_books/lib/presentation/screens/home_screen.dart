import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_save_books/presentation/widgets/book_item.dart';
import '../cubit/book_cubit.dart';
import '../cubit/book_state.dart';
import '../widgets/add_book_dialog.dart';
import '../widgets/delete_all_books_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const DeleteAllBooksDialog(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookLoaded) {
            if (state.books.isEmpty) {
              return const Center(child: Text('No books found.'));
            }
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder:
                  (context, index) => BookItem(book: state.books[index]),
            );
          } else if (state is BookError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No data.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddBookDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

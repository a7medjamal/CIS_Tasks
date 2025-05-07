import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_save_books/data/datasource/book_local_datasource.dart';
import 'package:sql_save_books/data/repositories/book_repository_impl.dart';
import 'package:sql_save_books/domain/usecases/add_book.dart';
import 'package:sql_save_books/domain/usecases/delete_book.dart';
import 'package:sql_save_books/domain/usecases/delete_all_books.dart';
import 'package:sql_save_books/domain/usecases/get_books.dart';
import 'package:sql_save_books/presentation/cubit/book_cubit.dart';
import 'package:sql_save_books/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dataSource = BookLocalDataSource();
  final repository = BookRepositoryImpl(dataSource);
  final getBooksUseCase = GetBooks(repository);
  final addBookUseCase = AddBook(repository);
  final deleteBookUseCase = DeleteBook(repository);
  final deleteAllBooksUseCase = DeleteAllBooks(repository);

  runApp(
    MyApp(
      getBooksUseCase: getBooksUseCase,
      addBookUseCase: addBookUseCase,
      deleteBookUseCase: deleteBookUseCase,
      deleteAllBooksUseCase: deleteAllBooksUseCase,
    ),
  );
}

class MyApp extends StatelessWidget {
  final GetBooks getBooksUseCase;
  final AddBook addBookUseCase;
  final DeleteBook deleteBookUseCase;
  final DeleteAllBooks deleteAllBooksUseCase;

  const MyApp({
    super.key,
    required this.getBooksUseCase,
    required this.addBookUseCase,
    required this.deleteBookUseCase,
    required this.deleteAllBooksUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => BookCubit(
            getBooksUseCase,
            addBookUseCase,
            deleteBookUseCase,
            deleteAllBooksUseCase,
          )..loadBooks(), // Trigger loading books on startup
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}

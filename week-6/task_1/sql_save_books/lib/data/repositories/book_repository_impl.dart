import 'package:sql_save_books/data/datasource/book_local_datasource.dart';
import 'package:sql_save_books/data/models/book_model.dart';
import 'package:sql_save_books/domain/entities/book.dart';
import 'package:sql_save_books/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource localDataSource;

  BookRepositoryImpl(this.localDataSource);

  @override
  Future<void> addBook(Book book) async {
    final model = BookModel(title: book.title, author: book.author);
    await localDataSource.addBook(model);
  }

  @override
  Future<void> deleteBook(int id) async => localDataSource.deleteBook(id);

  @override
  Future<void> deleteBookByTitle(String title) async =>
      localDataSource.deleteBookByTitle(title);

  @override
  Future<void> deleteAllBooks() async => localDataSource.deleteAllBooks();

  @override
  Future<List<Book>> getBooks() async {
    final bookModels = await localDataSource.getBooks();
    return bookModels
        .map((model) => Book(title: model.title, author: model.author))
        .toList(); // Convert BookModel to Book
  }
}

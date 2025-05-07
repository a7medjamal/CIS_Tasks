import 'package:sql_save_books/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<void> addBook(Book book);
  Future<void> deleteBook(int id);
  Future<void> deleteBookByTitle(String title);
  Future<void> deleteAllBooks();
}

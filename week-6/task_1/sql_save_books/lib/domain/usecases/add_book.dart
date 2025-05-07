import '../entities/book.dart';
import '../repositories/book_repository.dart';

class AddBook {
  final BookRepository repository;
  AddBook(this.repository);

  Future<void> call(Book book) => repository.addBook(book);
}

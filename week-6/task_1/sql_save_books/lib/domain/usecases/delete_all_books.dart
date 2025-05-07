import '../repositories/book_repository.dart';

class DeleteAllBooks {
  final BookRepository repository;

  DeleteAllBooks(this.repository);

  Future<void> call() => repository.deleteAllBooks();
}

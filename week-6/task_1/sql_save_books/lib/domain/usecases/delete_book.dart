import '../repositories/book_repository.dart';

class DeleteBook {
  final BookRepository repository;
  DeleteBook(this.repository);

  Future<void> call(int id) => repository.deleteBook(id);
  Future<void> deleteByTitle(String title) =>
      repository.deleteBookByTitle(title);
}

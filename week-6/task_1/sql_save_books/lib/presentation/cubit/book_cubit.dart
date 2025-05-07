import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book.dart';
import '../../domain/usecases/add_book.dart';
import '../../domain/usecases/delete_book.dart';
import '../../domain/usecases/delete_all_books.dart';
import '../../domain/usecases/get_books.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final GetBooks getBooks;
  final AddBook addBook;
  final DeleteBook deleteBook;
  final DeleteAllBooks deleteAllBooks;

  BookCubit(this.getBooks, this.addBook, this.deleteBook, this.deleteAllBooks)
    : super(BookInitial());

  void loadBooks() async {
    emit(BookLoading());
    try {
      final books = await getBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError('Failed to load books'));
    }
  }

  void createBook(Book book) async {
    try {
      await addBook(book);
      loadBooks();
    } catch (e) {
      emit(BookError('Failed to add book'));
    }
  }

  void deleteBookById(int id) async {
    try {
      await deleteBook(id);
      loadBooks();
    } catch (e) {
      emit(BookError('Failed to delete book'));
    }
  }

  void deleteBookByTitle(String title) async {
    try {
      await deleteBook.deleteByTitle(title);
      loadBooks();
    } catch (e) {
      emit(BookError('Failed to delete book'));
    }
  }

  void clearAllBooks() async {
    try {
      await deleteAllBooks();
      loadBooks();
    } catch (e) {
      emit(BookError('Failed to delete all books'));
    }
  }
}

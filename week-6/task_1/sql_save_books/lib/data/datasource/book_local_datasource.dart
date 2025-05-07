import 'package:sql_save_books/core/db/db_helper.dart';
import 'package:sql_save_books/data/models/book_model.dart';

class BookLocalDataSource {
  final dbHelper = DatabaseHelper.instance;

  Future<void> deleteDatabase() async {
    await dbHelper.deleteDatabase();
  }

  Future<List<BookModel>> getBooks() async {
    final db = await dbHelper.database;
    final result = await db.query(DatabaseHelper.table);
    return result.map((json) => BookModel.fromMap(json)).toList();
  }

  Future<void> addBook(BookModel book) async {
    final db = await dbHelper.database;
    await db.insert(DatabaseHelper.table, book.toMap());
  }

  Future<void> deleteBook(int id) async {
    final db = await dbHelper.database;
    await db.delete(DatabaseHelper.table, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteBookByTitle(String title) async {
    final db = await dbHelper.database;
    await db.delete(
      DatabaseHelper.table,
      where: 'title = ?',
      whereArgs: [title],
    );
  }

  Future<void> deleteAllBooks() async {
    final db = await dbHelper.database; // Corrected `database` to `db`
    await db.delete(
      DatabaseHelper.table,
    ); // Make sure the table name is correct
  }
}

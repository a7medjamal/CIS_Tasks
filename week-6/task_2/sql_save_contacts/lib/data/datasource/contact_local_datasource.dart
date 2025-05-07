import '../../core/db/db_helper.dart';
import '../models/contact_model.dart';

class ContactLocalDataSource {
  final dbHelper = DatabaseHelper.instance;

  Future<void> addContact(ContactModel contact) async {
    final db = await dbHelper.database;
    await db.insert('contacts', contact.toMap());
  }

  Future<List<ContactModel>> getContacts() async {
    final db = await dbHelper.database;
    final result = await db.query('contacts');
    return result.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<void> deleteContact(int id) async {
    final db = await dbHelper.database;
    await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateContact(ContactModel contact) async {
    final db = await dbHelper.database;
    await db.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }
}

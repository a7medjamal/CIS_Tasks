import '../entities/contact.dart';

abstract class ContactRepository {
  Future<void> addContact(Contact contact);
  Future<void> deleteContact(int id);
  Future<List<Contact>> getContacts();
  Future<void> updateContact(Contact contact);
}

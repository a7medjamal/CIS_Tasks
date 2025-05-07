import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repository.dart';
import '../datasource/contact_local_datasource.dart';
import '../models/contact_model.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactLocalDataSource dataSource;

  ContactRepositoryImpl(this.dataSource);

  @override
  Future<void> addContact(Contact contact) async {
    final model = ContactModel(
      id: contact.id,
      name: contact.name,
      number: contact.number,
      photoUrl: contact.photoUrl,
    );
    await dataSource.addContact(model);
  }

  @override
  Future<void> deleteContact(int id) async => dataSource.deleteContact(id);

  @override
  Future<List<Contact>> getContacts() async {
    final models = await dataSource.getContacts();
    return models;
  }
}

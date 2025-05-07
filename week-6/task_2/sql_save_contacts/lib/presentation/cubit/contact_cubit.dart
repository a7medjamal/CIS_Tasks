import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_save_contacts/presentation/cubit/contact_state.dart';
import '../../../domain/entities/contact.dart';
import '../../../domain/usecases/add_contact.dart';
import '../../../domain/usecases/delete_contact.dart';
import '../../../domain/usecases/get_contacts.dart';
import '../../../domain/usecases/update_contact.dart';

class ContactCubit extends Cubit<ContactState> {
  final GetContacts getContacts;
  final AddContact addContact;
  final DeleteContact deleteContact;
  final UpdateContact updateContact;

  ContactCubit(
    this.getContacts,
    this.addContact,
    this.deleteContact,
    this.updateContact,
  ) : super(ContactInitial());

  void loadContacts() async {
    emit(ContactLoading());
    final contacts = await getContacts();
    emit(ContactLoaded(contacts));
  }

  void createContact(Contact contact) async {
    await addContact(contact);
    loadContacts();
  }

  void removeContact(int id) async {
    await deleteContact(id);
    loadContacts();
  }

  void updateContactDetails(Contact contact) async {
    await updateContact(contact);
    loadContacts();
  }
}

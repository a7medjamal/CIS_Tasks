import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_save_contacts/data/datasource/contact_local_datasource.dart';
import 'package:sql_save_contacts/data/repositories/contact_repository_impl.dart';
import 'package:sql_save_contacts/domain/usecases/add_contact.dart';
import 'package:sql_save_contacts/domain/usecases/delete_contact.dart';
import 'package:sql_save_contacts/domain/usecases/get_contacts.dart';
import 'package:sql_save_contacts/presentation/cubit/contact_cubit.dart';
import 'package:sql_save_contacts/presentation/screens/contacts_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dataSource = ContactLocalDataSource();
  final repository = ContactRepositoryImpl(dataSource);
  final getContacts = GetContacts(repository);
  final addContact = AddContact(repository);
  final deleteContact = DeleteContact(repository);
  runApp(
    ContactManagementApp(
      getContacts: getContacts,
      addContact: addContact,
      deleteContact: deleteContact,
    ),
  );
}

class ContactManagementApp extends StatelessWidget {
  final GetContacts getContacts;
  final AddContact addContact;
  final DeleteContact deleteContact;

  const ContactManagementApp({
    super.key,
    required this.getContacts,
    required this.addContact,
    required this.deleteContact,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              ContactCubit(getContacts, addContact, deleteContact)
                ..loadContacts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ContactScreen(), // Make sure this matches your screen name
      ),
    );
  }
}

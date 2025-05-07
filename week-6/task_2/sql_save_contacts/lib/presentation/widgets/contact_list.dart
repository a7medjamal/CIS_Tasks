import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_save_contacts/presentation/screens/contact_details_screen.dart';
import '../cubit/contact_state.dart';
import '../cubit/contact_cubit.dart';
import 'contact_list_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        if (state is ContactLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ContactLoaded) {
          if (state.contacts.isEmpty) {
            return Center(child: Text('No contacts added yet.'));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: state.contacts.length,
            itemBuilder: (_, index) {
              final contact = state.contacts[index];
              return ContactListItem(
                contact: contact,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ContactDetailsScreen(contact: contact),
                      ),
                    ),
              );
            },
          );
        }
        return Center(child: Text('Something went wrong.'));
      },
    );
  }
}

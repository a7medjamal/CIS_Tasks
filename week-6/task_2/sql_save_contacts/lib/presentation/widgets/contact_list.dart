import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: (_, index) {
              final contact = state.contacts[index];
              return ContactListItem(contact: contact);
            },
          );
        }
        return Center(child: Text('Something went wrong.'));
      },
    );
  }
}

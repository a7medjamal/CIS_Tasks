import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/contact.dart';
import '../cubit/contact_cubit.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;
  const ContactListItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: ClipRRect(
          child: Image.network(
            contact.photoUrl,
            fit: BoxFit.fitWidth,
            width: 100,
            height: 100,
            errorBuilder:
                (context, error, stackTrace) =>
                    Icon(Icons.error, color: Colors.red, size: 40),
          ),
        ),
      ),
      title: Text(
        contact.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.number,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red[400], size: 30),
        onPressed:
            () => context.read<ContactCubit>().removeContact(contact.id!),
      ),
    );
  }
}

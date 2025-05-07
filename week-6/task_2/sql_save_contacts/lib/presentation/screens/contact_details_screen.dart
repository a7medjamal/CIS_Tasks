import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/contact.dart';
import '../cubit/contact_cubit.dart';
import '../widgets/contact_avatar.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_action_buttons.dart';

class ContactDetailsScreen extends StatefulWidget {
  final Contact contact;

  const ContactDetailsScreen({super.key, required this.contact});

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _numberController;
  late TextEditingController _photoUrlController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name);
    _numberController = TextEditingController(text: widget.contact.number);
    _photoUrlController = TextEditingController(text: widget.contact.photoUrl);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _photoUrlController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedContact = Contact(
      id: widget.contact.id,
      name: _nameController.text,
      number: _numberController.text,
      photoUrl: _photoUrlController.text,
    );
    context.read<ContactCubit>().updateContactDetails(updatedContact);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContactAvatar(photoUrl: widget.contact.photoUrl),
            const SizedBox(height: 24),
            ContactForm(
              nameController: _nameController,
              numberController: _numberController,
              photoUrlController: _photoUrlController,
            ),
            const SizedBox(height: 24),
            ContactActionButtons(contact: widget.contact, onSave: _saveChanges),
          ],
        ),
      ),
    );
  }
}

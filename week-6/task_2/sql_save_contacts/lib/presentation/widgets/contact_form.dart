import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController photoUrlController;

  const ContactForm({
    super.key,
    required this.nameController,
    required this.numberController,
    required this.photoUrlController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: numberController,
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: photoUrlController,
          decoration: const InputDecoration(
            labelText: 'Photo URL',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

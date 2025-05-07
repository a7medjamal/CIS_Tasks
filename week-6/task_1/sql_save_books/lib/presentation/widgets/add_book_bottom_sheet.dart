import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book.dart';
import '../cubit/book_cubit.dart';

class AddBookBottomSheet extends StatefulWidget {
  const AddBookBottomSheet({super.key});

  @override
  State<AddBookBottomSheet> createState() => _AddBookBottomSheetState();
}

class _AddBookBottomSheetState extends State<AddBookBottomSheet> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final imageUrlController = TextEditingController();
  bool isImageValid = true;

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  void _validateImageUrl(String url) {
    if (url.isEmpty) {
      setState(() => isImageValid = true);
      return;
    }
    try {
      Uri.parse(url);
      setState(() => isImageValid = true);
    } catch (e) {
      setState(() => isImageValid = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Book',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Book Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: authorController,
            decoration: const InputDecoration(
              labelText: 'Author',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: imageUrlController,
            decoration: InputDecoration(
              labelText: 'Image URL (optional)',
              border: const OutlineInputBorder(),
              errorText: !isImageValid ? 'Invalid URL format' : null,
            ),
            onChanged: _validateImageUrl,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  final title = titleController.text.trim();
                  final author = authorController.text.trim();
                  final imageUrl = imageUrlController.text.trim();
                  if (title.isEmpty || author.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all required fields'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  if (!isImageValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please enter a valid image URL or leave it empty',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  context.read<BookCubit>().createBook(
                    Book(
                      title: title,
                      author: author,
                      imageUrl: imageUrl.isEmpty ? null : imageUrl,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Add', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

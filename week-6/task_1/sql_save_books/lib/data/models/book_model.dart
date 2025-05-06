import '../../domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    super.id,
    required super.title,
    required super.author,
    required super.image,
  });

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
    id: json['id'],
    title: json['title'],
    author: json['author'],
    image: json['image'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'author': author,
    'image': image,
  };
}

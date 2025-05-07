import '../../domain/entities/contact.dart';

class ContactModel extends Contact {
  ContactModel({int? id, required String name, required String number, required String photoUrl})
      : super(id: id, name: name, number: number, photoUrl: photoUrl);

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      number: map['number'],
      photoUrl: map['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'photoUrl': photoUrl,
    };
  }
}

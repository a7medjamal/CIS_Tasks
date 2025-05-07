import '../repositories/contact_repository.dart';

class DeleteContact {
  final ContactRepository repository;

  DeleteContact(this.repository);

  Future<void> call(int id) {
    return repository.deleteContact(id);
  }
}

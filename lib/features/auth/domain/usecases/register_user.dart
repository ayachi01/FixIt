import 'package:fixit/features/auth/data/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;
  RegisterUser(this.repository);

  Future<Map<String, dynamic>> call(String email, String password) {
    return repository.registerUser(email, password);
  }
}

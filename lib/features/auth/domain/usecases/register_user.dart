import 'package:fixit/features/auth/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;
  RegisterUser(this.repository);

  Future<Map<String, dynamic>> call({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String role,
    required String confirmPassword,
  }) async {
    print("RegisterUser called with email: $email, role: $role");
    final result = await repository.registerUser(
      email,
      password,
      firstname,
      lastname,
      role,
    );
    print("RegisterUser result: $result");
    return result;
    
  }
}

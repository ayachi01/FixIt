import 'package:fixit/features/auth/data/repositories/auth_repository.dart';

class VerifyOtp {
  final AuthRepository repository;

  VerifyOtp(this.repository);

  Future<void> call(String email, String otp) {
    return repository.verifyOtp(email, otp);
  }
}

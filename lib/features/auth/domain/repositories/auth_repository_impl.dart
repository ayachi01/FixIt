import 'package:fixit/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fixit/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> registerUser(
    String email,
    String password,
    String firstname,
    String lastname,
    String role,
  ) async {
    return await remoteDataSource.registerUser(
      email,
      password,
      firstname,
      lastname,
      role,
    );
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    return await remoteDataSource.verifyOtp(email, otp);
  }
}

import 'package:fixit/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fixit/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> registerUser(String email, String password) async {
    return await remoteDataSource.registerUser(email, password);
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    return await remoteDataSource.verifyOtp(email, otp);
  }

  @override
  void initState() {
    super.initState();

    final remoteDataSource = AuthRemoteDataSource();
    final authRepository = AuthRepositoryImpl(remoteDataSource);

    viewModel = AuthVieModel(
      registerUserUseCase: RegisterUser(authRepository),
      verifyOtpUseCase: VerifyOtp(authRepository),
    );
  }
}

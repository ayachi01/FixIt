import 'package:flutter/foundation.dart';
import '../../domain/usecases/register_user.dart';
import '../../domain/usecases/verify_otp.dart';

class AuthViewModel extends ChangeNotifier {
  final RegisterUser registerUserUseCase;
  final VerifyOtp verifyOtpUseCase;

  bool isloading = false;
  String? errorMessage;

  AuthViewModel({
    required this.registerUserUseCase,
    required this.verifyOtpUseCase,
  });

  Future<void> register(
    String email,
    String password,
    String firstname,
    String lastname,
    String role,
  ) async {
    isloading = true;
    notifyListeners();

    try {
      await registerUserUseCase.call(
        email,
        password,
        firstname,
        lastname,
        role,
      );
    } catch (e) {
      errorMessage = e.toString();
    }

    isloading = false;
    notifyListeners();
  }

  Future<void> verifyOtp(String email, String otp) async {
    try {
      await verifyOtpUseCase(email, otp);
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}

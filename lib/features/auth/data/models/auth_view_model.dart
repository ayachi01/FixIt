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
  Future<void> register(String email, String password) async {
    isloading = true;
    notifyListeners();

    try {
      await registerUserUseCase(email, password);
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

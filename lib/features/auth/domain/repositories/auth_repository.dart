abstract class AuthRepository {
  Future<Map<String, dynamic>> registerUser(String email, String password);
  Future<void> verifyOtp(String email, String otp);
}

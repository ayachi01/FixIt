abstract class AuthRepository {
  

  Future<Map<String, dynamic>>registerUser(
    String email,
    String password,
    String firstname,
    String lastname,
    String role,
  );
   
  Future<void> verifyOtp(String email, String otp);
}
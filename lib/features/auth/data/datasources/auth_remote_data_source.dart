import 'dart:convert';
import 'package:http/http.dart' as http;
import '/core/constants/api_constant.dart';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<Map<String, dynamic>> registerUser(
    String email,
    String password,
    String firstname,
    String lastname,
    String role,
  ) async {
    final url = Uri.parse("${ApiConstants.baseUrlDevice}/auth/register");

    final body = {
      "email": email,
      "password": password,
      "first_name": firstname,
      "last_name": lastname,
      "confirm_password": password,
      "role": role,
    };
    print("Sending POST request to $url");
    print("Request body: ${json.encode(body)}");

    final response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception("Registration failed: ${response.body}");
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrlDevice}users/verify_otp/",
    ); // ✅ added trailing slash
    final response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email, "otp": otp}),
    );

    if (response.statusCode != 200) {
      throw Exception("OTP verification failed: ${response.body}");
    }
  }
}

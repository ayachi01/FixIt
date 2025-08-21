import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State <ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
 

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0XFFF8F8F8),
    body: SafeArea(
      child: 
      Column(
        children: [
          Text(
            "Forgot Password"
            )
          ],
        )
      )
    );
  }
}

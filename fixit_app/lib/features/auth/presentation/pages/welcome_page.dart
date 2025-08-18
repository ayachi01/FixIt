import 'package:flutter/material.dart';
import '/core/widgets/welcome_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8F8F8),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 350,
                  width: 350,
                  fit: BoxFit.contain,
                ),

                // Caption
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Need something',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 34,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' fixed?',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                        color: Color(0xFF386641),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Report campus maintenance issues quickly and efficiently',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login Button
                  SizedBox(
                    width: 380,
                    height: 56,
                    child: WelcomeButton(
                      text: "Login",
                    isPrimary: false,
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                ),
                const SizedBox(height: 20),

                // Sign Up Button
                SizedBox(
                  width: 380,
                  height: 56,
                  child: WelcomeButton(
                    text: "Sign Up",
                    isPrimary: true,
                    onPressed: () => Navigator.pushNamed(context, '/sign_up'),
                  ),
                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

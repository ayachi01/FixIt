import 'package:flutter/material.dart';
import '/core/widgets/welcome_button.dart';
import '/features/auth/presentation/pages/homepage.dart';
import '/core/theme/input_decoration.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Form Key
  final _forgotPasswordKey = GlobalKey<FormState>();
  // Controller
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8F8F8),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _forgotPasswordKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Image.asset(
                    'assets/images/mailbox.png',
                    height: 300,
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                ),

                // Title
                Center(
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'KantumruyPro',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Description
                const Text(
                  "Please enter the email address associated with your account.",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins-Black',
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFB0B0B0),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Email Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        color: Color(0XFF000000),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Email Field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration("name@example.com"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email!";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 200),

               // Confirm Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: WelcomeButton(
                    text: "Confirm",
                    isPrimary: true,
                    onPressed: () {
                      if (_forgotPasswordKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            ),
          ),
      ),
     );
  }
}

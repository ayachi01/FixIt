import 'package:flutter/material.dart';
import '/core/theme/input_decoration.dart';
import '/core/widgets/welcome_button.dart';
import '/features/auth/presentation/pages/create_password.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  // Form Key
  final _verifyEmailKey = GlobalKey<FormState>();
  // Controller
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8F8F8),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
          child: Form(
            key: _verifyEmailKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Mail Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 75),
                  child: Image.asset(
                    'assets/images/mail.png',
                    height: 300,
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                ),

                // Title
                Center(
                  child: const Text(
                    "Verify your email",
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
                Center(
                  child: const Text(
                    "Please enter the 4 digit code sent to your email.",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins-SemiBold',
                      fontWeight: FontWeight.w600,
                      color: Color(0XFFB0B0B0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Text Fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Row(
                    children: [

                      // Text Field 1
                      SizedBox(
                        width: 74,
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: inputDecoration(""),
                        ),
                      ),
                  
                      const SizedBox(width: 10),

                      // Text Field 2
                      SizedBox(
                        width: 74,
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: inputDecoration(""),
                        ),
                      ),
                  
                      const SizedBox(width: 10),

                      // Text Field 3
                      SizedBox(
                        width: 74,
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: inputDecoration(""),
                        ),
                      ),
                  
                      const SizedBox(width: 10),

                      // Text Field 4
                      SizedBox(
                        width: 74,
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: inputDecoration(""),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                   // Resend Code
                    GestureDetector(
                      onTap: () {
                      },
                      child: 
                      Center(
                        child: const Text(
                          "Resend code",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF4F774A),
                          ),
                        ),
                      ),
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
                      if (_verifyEmailKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreatePassword(),
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

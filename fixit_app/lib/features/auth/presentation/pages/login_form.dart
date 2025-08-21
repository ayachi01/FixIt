import 'package:flutter/material.dart';
import '/features/auth/presentation/pages/forgot_password.dart';
import '/features/auth/presentation/pages/homepage.dart';
import '/features/auth/presentation/pages/signup_form.dart';
import '/core/widgets/welcome_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formLoginKey = GlobalKey<FormState>();
  final _formPasswordKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Logo
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Login",
                style: TextStyle(
                  fontFamily: 'KantumruyPro',
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // Subtitle
              const Text(
                "Making campus maintenance simple and efficient.",
                style: TextStyle(
                  fontFamily: 'Poppins-SemiBold',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0XFF808080),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // Email Title
              Form(
                key: _formLoginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        color: Color(0XFF000000),
                      ),
                    ),

                    const SizedBox(height: 8),

                    //Email Text Field
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "name@example.com",
                        hintStyle: const TextStyle(
                          color: Color(0XFFB0B0B0),
                        ),

                        //Border
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),

                        //Enabled Border
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0XFFB0B0B0),
                            width: 1,
                          ),

                          //Border Radius
                          borderRadius: BorderRadius.circular(8),
                        ),

                        //Focused Border
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0XFF000000),
                            width: 1,
                          ),

                          //Border Radius
                          borderRadius: BorderRadius.circular(8),
                        ),

                        //Error Border
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0XFFDC3545),
                            width: 1,
                          ),

                          //Border Radius
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),

                      //Validator
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a email!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Password
              Form(
                key: _formPasswordKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        color: Color(0XFF000000),
                      ),
                    ),

                    const SizedBox(height: 8),

                    //Password Text Field
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: const TextStyle(
                          color: Color(0XFFB0B0B0),
                        ),

                        //Border
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),

                        //Enabled Border
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0XFFB0B0B0),
                            width: 1,
                          ),

                          //Border Radius
                          borderRadius: BorderRadius.circular(8),
                        ),

                        //Focused Border
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0XFF000000),
                            width: 1,
                          ),

                          //Border Radius
                          borderRadius: BorderRadius.circular(8),
                        ),

                        //Error Border
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0XFFDC3545),
                            width: 1,
                          ),

                          //Border Radius
                          borderRadius: BorderRadius.circular(8),
                        ),

                        //Password Visibility Icon
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),

                      //Validator
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF4F774A),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: WelcomeButton(
                  text: "Login",
                  isPrimary: true,
                  onPressed: () {
                    if (_formLoginKey.currentState!.validate() &&
                        _formPasswordKey.currentState!.validate()) {
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

              const SizedBox(height: 40),

              // Don't have an account row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(width: 6),

                  //Sign Up Text Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupForm(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF4F774A),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

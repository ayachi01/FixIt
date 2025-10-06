import 'package:fixit/features/auth/data/models/auth_view_model.dart';
import '/features/auth/domain/repositories/auth_repository.dart';
import '/features/auth/domain/usecases/register_user.dart';
import 'package:fixit/features/auth/domain/usecases/verify_otp.dart';
import 'package:flutter/material.dart';
import '/features/dashboard/presentation/pages/homepage.dart';
import '/features/auth/presentation/pages/login_form.dart';
import '/core/widgets/welcome_button.dart';
import '/core/theme/input_decoration.dart';
import '/core/constants/api_constant.dart';
import 'package:http/http.dart' as http;
import '/features/auth/domain/repositories/auth_repository_impl.dart';
import '/features/auth/data/datasources/auth_remote_data_source.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  // Form Key
  final _signUpFormKey = GlobalKey<FormState>();

  // Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? dropDownValue;
  bool obscurePassword = true;

  late final AuthViewModel viewModel;

  @override
  void initState() {
    super.initState();

    // Dependency Chain
    final httpClient = http.Client();
    final remoteDataSource = AuthRemoteDataSource(httpClient);
    final authRepository = AuthRepositoryImpl(remoteDataSource);

    viewModel = AuthViewModel(
      registerUserUseCase: RegisterUser(authRepository),
      verifyOtpUseCase: VerifyOtp(authRepository),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFFF8F8F8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 55),
        child: Form(
          key: _signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    // Title
                    child: Text(
                      "Create your account",
                      style: TextStyle(
                        fontFamily: 'KantumruyPro',
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Subtitle
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                child: Text(
                  "Join FixIt and start reporting maintenance issues",
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0XFF4D4D4D),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 15),

              // First Name Title
              const Text(
                "First Name",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Color(0XFF000000),
                ),
              ),
              const SizedBox(height: 8),

              // First Name Field
              TextFormField(
                controller: firstNameController,
                keyboardType: TextInputType.name,
                decoration: inputDecoration("Enter your first name"),

                // Validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your first name!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Last Name Title
              const Text(
                "Last Name",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Color(0XFF000000),
                ),
              ),
              const SizedBox(height: 8),

              // Last Name Field
              TextFormField(
                controller: lastNameController,
                keyboardType: TextInputType.name,
                decoration: inputDecoration("Enter your last name"),

                // Validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your last name!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Email Title
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Color(0XFF000000),
                ),
              ),
              const SizedBox(height: 8),

              // Email Field
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration("name@example.com"),

                // Validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Password Title
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Color(0XFF000000),
                ),
              ),
              const SizedBox(height: 8),

              // Password Field
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: inputDecoration("Enter your password").copyWith(
                  // Toggle Password Visibility Icon
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),

                // Validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Confirm Password Title
              const Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Color(0XFF000000),
                ),
              ),
              const SizedBox(height: 8),

              // Confirm Password Field
              TextFormField(
                controller: confirmPasswordController,
                obscureText: obscurePassword,
                decoration: inputDecoration("Confirm your password").copyWith(
                  // Toggle Password Visibility Icon
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),

                // Validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password!";
                  }
                  if (value != passwordController.text) {
                    return "Passwords do not match!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // User Role Title
              const Text(
                "User Role",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: Color(0XFF000000),
                ),
              ),

              const SizedBox(height: 8),

              // User Selection Role
              DropdownButtonFormField<String>(
                initialValue: dropDownValue,
                hint: const Text('I am a...'),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },

                // Drop Down Items
                items: const [
                  // Student
                  DropdownMenuItem<String>(
                    value: 'Student',
                    child: Text('Student'),
                  ),
                  // Faculty
                  DropdownMenuItem<String>(
                    value: 'Faculty',
                    child: Text('Faculty'),
                  ),
                  // Staff
                  DropdownMenuItem<String>(
                    value: 'Staff',
                    child: Text('Staff'),
                  ),
                ],
                decoration: inputDecoration(""),

                // Validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select an option!";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 40),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: WelcomeButton(
                  text: "Sign Up",
                  isPrimary: true,
                  onPressed: () async {
                    if (_signUpFormKey.currentState!.validate()) {
                      try {
                        final registrationData = RegistrationData(
                          firstName: firstNameController.text.trim(),
                          lastName: lastNameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          role: dropDownValue ?? "",
                        );

                        await viewModel.register(
                          emailController.text.trim(),
                          passwordController.text.trim(),

                          firstNameController.text.trim(),
                          lastNameController.text.trim(),
                          dropDownValue ?? "",
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              firstNameController: firstNameController,
                              lastNameController: lastNameController,
                              emailController: emailController,
                            ),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registration failed: $e")),
                        );
                      }
                      ;
                    }
                  },
                ),
              ),
              const SizedBox(height: 40),

              // Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                  ),

                  const SizedBox(width: 6),

                  // Login Text Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginForm(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
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

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

class RegistrationData {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String role;

  RegistrationData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.role,
  });
}

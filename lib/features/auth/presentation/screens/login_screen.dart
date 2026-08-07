import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';
import '../../../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

Future<void> login() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  final result = await AuthService.login(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );

  if (!mounted) return;

  if (result['success'] == true) {
    print("Login successful");

    context.go('/home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result['message'] ?? 'Login failed'),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Form(

            key: _formKey,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                const SizedBox(height: 50),

                const Icon(
                  Icons.restaurant,
                  size: 80,
                ),

                const SizedBox(height: 20),

                const Center(
                  child: Text(
                    "Hungry Zombies",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                CustomTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  prefixIcon: Icons.email_outlined,

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(

                  controller: passwordController,

                  obscureText: obscurePassword,

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    return null;
                  },

                  decoration: InputDecoration(

                    hintText: "Enter your password",

                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: IconButton(

                      onPressed: () {

                        setState(() {

                          obscurePassword = !obscurePassword;

                        });

                      },

                      icon: Icon(

                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,

                      ),

                    ),

                  ),

                ),

                const SizedBox(height: 10),

                Align(

                  alignment: Alignment.centerRight,

                  child: TextButton(

                    onPressed: () {},

                    child: const Text("Forgot Password?"),

                  ),

                ),

                const SizedBox(height: 20),

                PrimaryButton(

                  title: "LOGIN",

                  onPressed: login,

                ),

                const SizedBox(height: 30),

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const Text("Don't have an account?"),

                    TextButton(

                      onPressed: () {
                        context.push('/signup');
},
                      child: const Text("Create Account"),

                    )

                  ],

                )

              ],

            ),

          ),

        ),

      ),

    );

  }

}
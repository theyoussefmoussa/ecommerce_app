import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/validator.dart';
import 'package:ecommerce_app/features/controller/firebase_authentication.dart';
import 'package:ecommerce_app/features/view/widget/auth_field.dart';
import 'package:ecommerce_app/main_screen.dart';

class AuthForm extends StatefulWidget {
  final bool isLogin;

  const AuthForm({super.key, required this.isLogin});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _username = TextEditingController();

  final _authService = FirebaseAuthService();
  bool _loading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (!widget.isLogin &&
        _password.text.trim() != _confirmPassword.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() => _loading = true);

    final email = _email.text.trim();
    final password = _password.text.trim();
    final username = _username.text.trim();

    final result = widget.isLogin
        ? await _authService.login(email, password)
        : await _authService.signUp(email, password, username);

    if (!mounted) return;

    if (result.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isLogin ? 'Login Successful' : 'Sign Up Successful',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF755dc1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            result.errorMessage ?? 'Authentication failed',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }

    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isLogin ? 'Login' : 'Sign Up';

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: const Color(0xFF1D1A31),
              fontWeight: FontWeight.w800,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 24),

          if (!widget.isLogin)
            AuthField(
              controller: _username,
              label: 'Username',
              hint: 'Enter your username',
              icon: Icons.person,
              validator: Validators.validateUsername,
              fillColor: Colors.white,
            ),

          AuthField(
            controller: _email,
            label: 'Email',
            hint: 'Enter your email',
            icon: Icons.email,
            validator: Validators.validateEmail,
            fillColor: Colors.white,
          ),

          // ✅ Password + Confirm Password جنب بعض
          if (widget.isLogin)
            AuthField(
              controller: _password,
              label: 'Password',
              hint: 'Enter your password',
              icon: Icons.lock,
              obscureText: true,
              validator: Validators.validatePassword,
              fillColor: Colors.white,
            )
          else
            Row(
              children: [
                Expanded(
                  child: AuthField(
                    controller: _password,
                    label: 'Password',
                    hint: 'Enter password',
                    icon: Icons.lock,
                    obscureText: true,
                    validator: Validators.validatePassword,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AuthField(
                    controller: _confirmPassword,
                    label: 'Confirm',
                    hint: 'Confirm password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                    validator: Validators.validatePassword,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),

          const SizedBox(height: 14),

          _loading
              ? const Center(
                  child: CircularProgressIndicator(color: Color(0xFF755dc1)),
                )
              : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFF755dc1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

          const SizedBox(height: 10),

          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  widget.isLogin ? '/signup' : '/login',
                );
              },
              child: RichText(
                text: TextSpan(
                  text: widget.isLogin
                      ? "Don't have an account? "
                      : "Already have an account? ",
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                  children: [
                    TextSpan(
                      text: widget.isLogin ? 'Sign Up' : 'Login',
                      style: const TextStyle(
                        color: Color(0xFF755dc1),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

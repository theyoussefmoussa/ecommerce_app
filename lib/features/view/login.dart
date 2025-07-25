import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/view/auth_form.dart';
import 'package:ecommerce_app/core/utils/constants/constant_colors.dart'
    as app_colors;

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // ⛑️ علشان نتفادى overflow على شاشات صغيرة
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ صورة العنوان
            Image.asset(
              "assets/images/vector-1.png", // ✅ غيرها حسب صورة الـ login
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 18),

            // 🧾 محتوى الفورم داخل كارت
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: app_colors.mochaBrown.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AuthForm(isLogin: true),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

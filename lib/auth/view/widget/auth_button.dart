import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/constants/constant_colors.dart'
    as app_colors;

class AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  const AuthButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isPrimary
        ? const Color(0xFF755dc1) // البنفسجي
        : Colors.white;

    final Color textColor = isPrimary ? Colors.white : Colors.black;

    final BorderSide borderSide = isPrimary
        ? BorderSide.none
        : const BorderSide(color: app_colors.lightPink);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: borderSide,
          ),
          elevation: 2,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

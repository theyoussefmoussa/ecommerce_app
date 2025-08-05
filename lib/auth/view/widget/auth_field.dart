import 'package:ecommerce_app/core/utils/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Color? fillColor;

  const AuthField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.validator,
    this.obscureText = false,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        style: const TextStyle(color: darker),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: maincolor),
          labelStyle: const TextStyle(color: darker),
          hintStyle: const TextStyle(color: maincolor),
          filled: true,
          fillColor: fillColor ?? Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: maincolor,
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: darker,
              width: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}

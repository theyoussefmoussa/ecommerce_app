import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/constants/constant_colors.dart';

enum SnackBarType { success, error, info }

class CustomSnackBar {
  static void show(
    BuildContext context,
    String message,
    SnackBarType type, {
    SnackBarAction? action,
  }) {
    final Color backgroundColor;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = priceGreen;
        break;
      case SnackBarType.error:
        backgroundColor = Colors.redAccent;
        break;
      case SnackBarType.info:
        backgroundColor = Colors.blueGrey;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        action: action, // <-- Apply action if provided
      ),
    );
  }
}

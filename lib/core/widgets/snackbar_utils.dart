import 'package:flutter/material.dart';

void showAddedToCartSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars(); // Avoid overlapping snackbars

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: const [
          Icon(
            Icons.check_circle_outline,
            color: Color.fromARGB(255, 22, 153, 40),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Product added to cart!',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      duration: const Duration(milliseconds: 1400),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color.fromARGB(255, 61, 61, 61)),
      ),
      action: SnackBarAction(
        label: 'View Cart',
        textColor: const Color.fromARGB(255, 0, 0, 0),
        onPressed: () => Navigator.pushNamed(context, '/cart'),
      ),
    ),
  );
}

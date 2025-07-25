import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/cart/controller/cart_provider.dart';

AppBar buildAppBarWithCart(BuildContext context, WidgetRef ref) {
  final cartItems = ref.watch(cartControllerProvider);
  final totalItems = cartItems.fold<int>(0, (sum, item) => sum + item.quantity);

  return AppBar(
    title: const Text(
      'Products',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF6C63FF),
    elevation: 2,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: [
      Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          if (totalItems > 0)
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF6C63FF),
                ),
                child: Text(
                  '$totalItems',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    ],
  );
}

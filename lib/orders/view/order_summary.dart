// 📌 Purpose: Shows cart summary before confirming and navigating to delivery info page

import 'package:ecommerce_app/core/utils/constants/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/constants/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/cart/models/cart_item.dart';
import 'package:ecommerce_app/app_router.dart';

class OrderSummary extends StatelessWidget {
  final List<CartItem> items;
  final double total;

  const OrderSummary({super.key, required this.items, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'My Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final item = items[index];
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        item.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        'Qty: ${item.quantity}',
                        style: const TextStyle(color: Colors.black87),
                      ),
                      trailing: Text(
                        '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Container holds both Total & Confirm Order
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xff6b63ff),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (items.isNotEmpty && total > 0) {
                        Navigator.pushNamed(context, AppRouter.deliveryInfo);
                      } else {
                        CustomSnackBar.show(
                          context,
                          "🛒 Your cart is empty!",
                          SnackBarType.info,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.shopping_bag, color: Color(0xff6b63ff)),
                        SizedBox(width: 10),
                        Text(
                          'Confirm Order',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff6b63ff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

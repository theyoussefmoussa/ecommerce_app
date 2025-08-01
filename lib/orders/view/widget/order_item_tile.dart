// 📌 Purpose: Reusable list tile to display a single order item in order history

import 'package:flutter/material.dart';
import 'package:ecommerce_app/cart/models/cart_item.dart';
import 'package:ecommerce_app/core/utils/constants/constant_colors.dart';


class OrderItemTile extends StatelessWidget {
  final CartItem item;

  const OrderItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: deepChocolate.withValues(),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: mochaBrown,
            child: Text(
              '${item.quantity}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            item.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: lightPink,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'x${item.quantity} @ \$${item.price.toStringAsFixed(2)}',
            style: const TextStyle(color: softRose),
          ),
          trailing: Text(
            '\$${(item.price * item.quantity).toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

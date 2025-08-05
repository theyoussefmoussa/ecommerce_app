import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/cart/models/cart_item.dart';
import 'package:ecommerce_app/cart/controller/cart_provider.dart';

class CartItemTile extends ConsumerWidget {
  final CartItem item;
  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(cartControllerProvider.notifier);

    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const Icon(
                  Icons.broken_image,
                  color: Colors.white54,
                  size: 60,
                ),
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${item.price.toStringAsFixed(2)} x ${item.quantity} = \$${(item.price * item.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 22,
                    color: Color.fromARGB(179, 0, 0, 0),
                  ),
                  onPressed: () => cart.removeOneFromCart(item.id),
                  tooltip: 'Decrease quantity',
                ),
                Text(
                  '${item.quantity}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 22,
                    color: Color.fromARGB(179, 0, 0, 0),
                  ),
                  onPressed: () => cart.addToCart(item),
                  tooltip: 'Increase quantity',
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 22,
                    color: Colors.redAccent,
                  ),
                  onPressed: () =>
                      cart.removeOneFromCart(item.id, removeAll: true),
                  tooltip: 'Remove item',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

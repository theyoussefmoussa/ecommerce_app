import 'package:ecommerce_app/core/utils/constants/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/products/models/product_model.dart';
import 'package:ecommerce_app/core/utils/cart_utils.dart';

class ProductCardWidget extends ConsumerWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  product.thumbnail,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),

            // Info and add-to-cart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  // Product title and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            color: Color(0xFF388E3C), // soft green
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add to cart button
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        255,
                        255,
                        255,
                      ), // mocha brown
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        addToCartHelper(ref, product);
                        CustomSnackBar.show(
                          context,
                          '✓ Added to cart!',
                          SnackBarType.success,
                          action: SnackBarAction(
                            label: 'View Cart',
                            onPressed: () =>
                                Navigator.pushNamed(context, '/cart'),
                            textColor: Colors.white,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/products/models/product_model.dart';
import 'package:ecommerce_app/core/utils/cart_utils.dart';

class ProductDetailScreen extends ConsumerWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const primaryColor = Color(0xff6b63ff); // نفس لون الكارت
    const priceColor = Color(0xff00c853); // أخضر للسعر

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ صورة المنتج - تم تكبيرها وتعديل نسبتها
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                height:
                    MediaQuery.of(context).size.height * 0.35, // ارتفاع أكبر
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  image: DecorationImage(
                    image: NetworkImage(product.thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ✅ اسم المنتج
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),

            // ✅ السعر
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: priceColor,
              ),
            ),
            const SizedBox(height: 16),

            // ✅ الوصف
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 30),

            // ✅ زر الإضافة للسلة
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  addToCartHelper(ref, product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "✓ Product added to cart!",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(milliseconds: 1500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: primaryColor),
                      ),
                      action: SnackBarAction(
                        label: "View Cart",
                        onPressed: () => Navigator.pushNamed(context, '/cart'),
                        textColor: primaryColor,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                label: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

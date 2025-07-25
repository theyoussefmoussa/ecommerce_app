// 📌 Purpose: Shows product grid with search and cart count indicator

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/products/controller/product_control.dart';
import 'package:ecommerce_app/products/view/widget/product_card_widget.dart';
import 'package:ecommerce_app/app_router.dart';
import 'package:ecommerce_app/cart/controller/cart_provider.dart';
import 'package:ecommerce_app/core/utils/constants/constant_colors.dart'
    as app_colors;

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productControllerProvider);
    final productCtrl = ref.read(productControllerProvider.notifier);
    final cartCount = ref
        .watch(cartControllerProvider)
        .fold<int>(0, (i, e) => i + e.quantity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        backgroundColor: Color(0xff6b63ff),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
              if (cartCount > 0)
                CircleAvatar(
                  radius: 8,
                  backgroundColor: app_colors.errorRed,
                  child: Text(
                    '$cartCount',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                onChanged: productCtrl.searchProducts,
              ),
            ),
            Expanded(
              child: productState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : productState.products.isEmpty
                  ? const Center(child: Text("No products found."))
                  : GridView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: productState.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 600
                            ? 5
                            : 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final product = productState.products[index];
                        return ProductCardWidget(
                          product: product,
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRouter.productDetail,
                            arguments: product,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

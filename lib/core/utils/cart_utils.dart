// 📌 Purpose: Converts a Product into CartItem and adds it to the cart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/cart/controller/cart_provider.dart';
import 'package:ecommerce_app/cart/models/cart_item.dart';
import 'package:ecommerce_app/products/models/product_model.dart';

void addToCartHelper(WidgetRef ref, Product product) {
  ref
      .read(cartControllerProvider.notifier)
      .addToCart(
        CartItem(
          id: product.id,
          title: product.title,
          price: product.price,
          image: product.thumbnail,
        ),
      );
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/cart/controller/cart_controller.dart';
import 'package:ecommerce_app/cart/models/cart_item.dart';

final cartControllerProvider =
    StateNotifierProvider<CartController, List<CartItem>>(
      (ref) => CartController(),
    );

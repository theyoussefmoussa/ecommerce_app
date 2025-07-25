// 📌 Purpose: Manages order state and business logic

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/orders/models/order_model.dart';
import 'package:ecommerce_app/orders/repository/order_repository.dart';
import 'package:ecommerce_app/cart/models/cart_item.dart';

class OrderController extends StateNotifier<List<Order>> {
  final OrderRepository _repo;

  OrderController(this._repo) : super([]);

  void placeOrder({
    required List<CartItem> items,
    required double totalPrice,
    required String phone,
    required String address,
    required String city,
  }) {
    final order = _repo.createOrder(
      items: items,
      totalPrice: totalPrice,
      phone: phone,
      address: address,
      city: city,
    );
    state = [...state, order];
  }
}

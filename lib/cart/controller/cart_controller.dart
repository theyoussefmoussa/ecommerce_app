// Controller: Handles cart logic using Riverpod's StateNotifier.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';

class CartController extends StateNotifier<List<CartItem>> {
  CartController() : super([]);

  void addToCart(CartItem item) {
    final index = state.indexWhere((e) => e.id == item.id);
    if (index >= 0) {
      state[index].quantity += 1;
      state = [...state];
    } else {
      state = [...state, item];
    }
  }

  void removeOneFromCart(int productId, {bool removeAll = false}) {
    final index = state.indexWhere((item) => item.id == productId);
    if (index == -1) return;

    if (removeAll) {
      state = state.where((item) => item.id != productId).toList();
    } else {
      final item = state[index];
      if (item.quantity > 1) {
        item.quantity -= 1;
        state = [...state];
      } else {
        state = state.where((item) => item.id != productId).toList();
      }
    }
  }

  void updateQuantity(int productId, int newQuantity) {
    final index = state.indexWhere((e) => e.id == productId);
    if (index != -1) {
      state[index].quantity = newQuantity;
      state = [...state];
    }
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice =>
      state.fold(0, (sum, item) => sum + item.price * item.quantity);
}

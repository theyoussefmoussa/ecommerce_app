// Repository: Manages data operations for the cart (mock or local for now).

import '../models/cart_item.dart';

class CartRepository {
  final List<CartItem> _items = [];

  List<CartItem> getCartItems() => List.unmodifiable(_items);

  void addToCart(CartItem item) {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(item);
    }
  }

  void removeFromCart(int productId) {
    _items.removeWhere((item) => item.id == productId);
  }

  void updateQuantity(int productId, int newQuantity) {
    final index = _items.indexWhere((e) => e.id == productId);
    if (index != -1) {
      _items[index].quantity = newQuantity;
    }
  }

  void clearCart() {
    _items.clear();
  }

  double getTotalPrice() {
    return _items.fold(0, (sum, item) => sum + item.price * item.quantity);
  }
}

// 📌 Purpose: Responsible for creating and managing orders

import 'package:ecommerce_app/cart/models/cart_item.dart';
import 'package:ecommerce_app/orders/models/order_model.dart';
import 'package:uuid/uuid.dart';

class OrderRepository {
  final _uuid = const Uuid();

  Order createOrder({
    required List<CartItem> items,
    required double totalPrice,
    required String phone,
    required String address,
    required String city,
  }) {
    return Order(
      id: _uuid.v4(),
      items: items,
      totalPrice: totalPrice,
      orderDate: DateTime.now(),
      phone: phone,
      address: address,
      city: city,
    );
  }
}

// 📌 Purpose: Defines the Order data model

import 'package:ecommerce_app/cart/models/cart_item.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final double totalPrice;
  final DateTime orderDate;
  final String phone;
  final String address;
  final String city;

  Order({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.orderDate,
    required this.phone,
    required this.address,
    required this.city,
  });
}

// 📌 Purpose: Provides the OrderController using Riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/orders/controller/order_controller.dart';
import 'package:ecommerce_app/orders/models/order_model.dart';
import 'package:ecommerce_app/orders/repository/order_repository.dart';

final orderControllerProvider =
    StateNotifierProvider<OrderController, List<Order>>(
      (ref) => OrderController(OrderRepository()),
    );

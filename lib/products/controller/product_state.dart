// Holds loading state and product list
import 'package:ecommerce_app/products/models/product_model.dart';

class ProductState {
  final bool isLoading;
  final List<Product> products;

  ProductState({
    this.isLoading = false,
    this.products = const [],
  });

  ProductState copyWith({
    bool? isLoading,
    List<Product>? products,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
    );
  }
}

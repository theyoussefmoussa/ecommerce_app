// 📌 Purpose: Holds product loading state and business logic

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/products/models/product_model.dart';
import 'package:ecommerce_app/products/repository/product_repository.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;

  ProductState({required this.products, required this.isLoading});

  factory ProductState.initial() => ProductState(products: [], isLoading: true);

  ProductState copyWith({List<Product>? products, bool? isLoading}) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final productControllerProvider =
    StateNotifierProvider<ProductController, ProductState>(
      (ref) => ProductController(ProductRepository()),
    );

class ProductController extends StateNotifier<ProductState> {
  final ProductRepository _repo;
  ProductController(this._repo) : super(ProductState.initial()) {
    fetchAllProducts();
  }

  Future<void> fetchAllProducts() async {
    state = state.copyWith(isLoading: true);
    final products = await _repo.fetchProducts();
    state = state.copyWith(products: products, isLoading: false);
  }

  Future<void> searchProducts(String query) async {
    state = state.copyWith(isLoading: true);
    final results = query.isEmpty
        ? await _repo.fetchProducts()
        : await _repo.searchProducts(query);
    state = state.copyWith(products: results, isLoading: false);
  }
}

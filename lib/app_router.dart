// core design constraints

import 'package:ecommerce_app/cart/view/cart_screen.dart';
import 'package:ecommerce_app/main_screen.dart';
import 'package:ecommerce_app/orders/view/delivery_info_page.dart';
import 'package:ecommerce_app/orders/view/order_summary.dart';
import 'package:ecommerce_app/features/view/login.dart';
import 'package:ecommerce_app/features/view/signup.dart';
import 'package:ecommerce_app/features/view/welcome.dart';
import 'package:ecommerce_app/products/models/product_model.dart';
import 'package:ecommerce_app/products/view/product_detail_screen.dart';
import 'package:ecommerce_app/products/view/product_list_screen.dart';
import 'package:ecommerce_app/profile/view/about_us_screen';
import 'package:ecommerce_app/profile/view/edit_profile_screen.dart';
import 'package:ecommerce_app/profile/view/settings_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String welcome = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String productList = '/productList';
  static const String productDetail = '/productDetail';
  static const String cartPage = '/cart';
  static const String ordersummary = '/orderSummary';
  static const String deliveryInfo = '/deliveryInfo';
  static const String editProfileScreen = '/editProfileScreen';
  static const String mainScreen = '/mainScreen';
  static const String settings = '/settings';
  static const String aboutUsScreen = '/aboutUsScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const Welcome());
      case productList:
        return MaterialPageRoute(builder: (_) => ProductListScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case signup:
        return MaterialPageRoute(builder: (_) => const Signup());
      case cartPage:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case AppRouter.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case deliveryInfo:
        return MaterialPageRoute(builder: (_) => const DeliveryInfoPage());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case AppRouter.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case aboutUsScreen:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      case ordersummary:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) =>
              OrderSummary(items: args['items'], total: args['total']),
        );

      case productDetail:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/orders/provider/order_provider.dart';
import 'package:ecommerce_app/cart/controller/cart_provider.dart';

class DeliveryInfoPage extends ConsumerStatefulWidget {
  const DeliveryInfoPage({super.key});

  @override
  ConsumerState<DeliveryInfoPage> createState() => _DeliveryInfoPageState();
}

class _DeliveryInfoPageState extends ConsumerState<DeliveryInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final cart = ref.read(cartControllerProvider);
      final cartTotal = ref.read(cartControllerProvider.notifier).totalPrice;

      ref
          .read(orderControllerProvider.notifier)
          .placeOrder(
            items: cart,
            totalPrice: cartTotal,
            phone: _phoneController.text.trim(),
            address: _addressController.text.trim(),
            city: _cityController.text.trim(),
          );

      ref.read(cartControllerProvider.notifier).clearCart();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: const Color(0xFF6B63FF),
          title: const Text(
            '🎉 Order Confirmed!',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          content: Text(
            '📞 ${_phoneController.text}\n🏠 ${_addressController.text}, ${_cityController.text}',
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/mainScreen',
                  (route) => false,
                );
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black87, fontSize: 16),
        filled: true,
        fillColor: const Color(0xFFF3F3F3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF6B63FF)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) =>
          value == null || value.trim().isEmpty ? 'Required' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Delivery Information',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6B63FF),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildTextField(
              label: 'Phone Number',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            _buildTextField(label: 'Address', controller: _addressController),
            const SizedBox(height: 12),
            _buildTextField(label: 'City', controller: _cityController),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B63FF),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Confirm Delivery Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

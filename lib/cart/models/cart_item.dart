// 📌 Purpose: Represents an item added to the cart

class CartItem {
  final int id;
  final String title;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json['id'],
    title: json['title'],
    image: json['image'],
    price: json['price'].toDouble(),
    quantity: json['quantity'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'image': image,
    'price': price,
    'quantity': quantity,
  };
}

import 'package:ashiiker_cs/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final double totalAmount;
  final String status;
  // Add other relevant order fields (e.g., shipping address, installment plan)

  Order({
    required this.id,
    required this.products,
    required this.totalAmount,
    required this.status,
    // ... other fields
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['_id'] ?? '',
        products: List<Product>.from(
            json['products'].map((x) => Product.fromJson(x))),
        totalAmount: double.parse(json['totalAmount'].toString()),
        status: json['status'] ?? '',
        // ... other fields
      );
}
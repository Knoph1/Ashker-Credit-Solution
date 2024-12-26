import 'package:ashiiker_cs/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            const SizedBox(height: 16.0),
            Text(product.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8.0),
            Text(product.description),
            const SizedBox(height: 16.0),
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            // Add "Buy Now" and "Apply for BNPL" buttons here
          ],
        ),
      ),
    );
  }
}
import 'package:ashiiker_cs/models/order.dart';
import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  final Order order;

  const OrderSummaryCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display order details (products, total amount, shipping address)
          ],
        ),
      ),
    );
  }
}
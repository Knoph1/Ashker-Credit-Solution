import 'package:ashiiker_cs/models/installment_plan.dart';
import 'package:flutter/material.dart';

class InstallmentPlanCard extends StatelessWidget {
  final InstallmentPlan plan;

  const InstallmentPlanCard({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('${plan.termMonths} Months'),
            Text('Interest Rate: ${plan.interestRate}%'),
            Text('Monthly Payment: \$${plan.monthlyPayment.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
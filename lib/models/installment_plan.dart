class InstallmentPlan {
  final int termMonths;
  final double interestRate;
  final double monthlyPayment;

  InstallmentPlan({
    required this.termMonths,
    required this.interestRate,
    required this.monthlyPayment,
  });
}
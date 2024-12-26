//import 'package:ashiiker_cs/screens/onboarding_screen.dart';
import 'package:ashiiker_cs/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AshkerCreditApp());
}

class AshkerCreditApp extends StatelessWidget {
  const AshkerCreditApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ashker Credit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: const OnboardingScreen(),
    );
  }
}
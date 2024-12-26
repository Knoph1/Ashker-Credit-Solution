import 'package:ashiiker_cs/screens/registration_screen.dart';
import 'package:ashiiker_cs/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Ashker Credit',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
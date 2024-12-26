import 'package:ashiiker_cs/screens/employment_info_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                labelText: 'Name',
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              CustomTextField(
                labelText: 'Phone Number',
                onChanged: (value) => setState(() => _phoneNumber = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              CustomTextField(
                labelText: 'Email',
                onChanged: (value) => setState(() => _email = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              CustomTextField(
                labelText: 'Password',
                obscureText: true,
                onChanged: (value) => setState(() => _password = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Send registration data to AWS backend
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EmploymentInfoScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
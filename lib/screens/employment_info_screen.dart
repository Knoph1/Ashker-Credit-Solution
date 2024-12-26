// lib/screens/employment_info_screen.dart
import 'package:ashiiker_cs/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class EmploymentInfoScreen extends StatefulWidget {
  const EmploymentInfoScreen({super.key});

  @override
  State<EmploymentInfoScreen> createState() => _EmploymentInfoScreenState();
}

class _EmploymentInfoScreenState extends State<EmploymentInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _companyName = '';
  String _employeeId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employment Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                labelText: 'Company Name',
                onChanged: (value) => setState(() => _companyName = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your company name';
                  }
                  return null;
                },
              ),
              CustomTextField(
                labelText: 'Employee ID',
                onChanged: (value) => setState(() => _employeeId = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your employee ID';
                  }
                  return null;
                },
              ),
              CustomButton(
                text: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Send employment information to AWS backend
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VerificationScreen(employeeId: '_employeeId',)),
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

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerificationScreen extends StatefulWidget {
  final String employeeId;

  const VerificationScreen({Key? key, required this.employeeId})//
      : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _isLoading = false;
  String _verificationMessage = '';
  bool _isVerified = false;

  Future<void> _verifyEmployee() async {
    setState(() {
      _isLoading = true;
      _verificationMessage = 'Verifying...';
    });

    try {
      final response = await http.post(
        Uri.parse('YOUR_AWS_API_ENDPOINT/verify'), // Replace with your endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'employeeId': widget.employeeId}),
      ).timeout(const Duration(seconds: 10)); // Add a timeout

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        bool verificationStatus = responseData['verified'] ?? false;
        setState(() {
          _isVerified = verificationStatus;
          _verificationMessage = responseData['message'] ?? 'Verification successful!';
        });
        if(_isVerified){
           Navigator.pushNamed(context, '/products');
        }

      } else {
        setState(() {
          _verificationMessage =
              'Verification failed. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _verificationMessage = 'An error occurred during verification: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _verifyEmployee(); // Automatically start verification on screen load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? const CircularProgressIndicator()
                  : _isVerified ? const Icon(Icons.check_circle_outline, color: Colors.green, size: 40,) : const Icon(Icons.error_outline, color: Colors.red, size: 40,),
              const SizedBox(height: 16),
              Text(
                _verificationMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              if (!_isVerified && !_isLoading)
                ElevatedButton(
                  onPressed: _verifyEmployee, // Retry verification
                  child: const Text('Retry Verification'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
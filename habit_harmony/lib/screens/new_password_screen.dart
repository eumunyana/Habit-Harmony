import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green, // Use the app's primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Set New Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Use the app's primary color
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              decoration: const InputDecoration(labelText: 'New Password'),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 20),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _resetPassword(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Use the app's primary color
              ),
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }

  void _resetPassword(BuildContext context) {
    setState(() {
      if (_newPasswordController.text == _confirmPasswordController.text) {
        _errorMessage = null;
        Navigator.pushNamed(context, '/'); // Redirect to home screen
      } else {
        _errorMessage = 'Passwords do not match';
      }
    });
  }
}

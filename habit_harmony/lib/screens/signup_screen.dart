import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Full Name')),
            const TextField(decoration: InputDecoration(labelText: 'Email')),
            const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            const TextField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

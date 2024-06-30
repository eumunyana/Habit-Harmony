import 'package:flutter/material.dart';

class ResetCodeScreen extends StatelessWidget {
  const ResetCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Reset Code'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle code verification
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Verify Code'),
            ),
          ],
        ),
      ),
    );
  }
}

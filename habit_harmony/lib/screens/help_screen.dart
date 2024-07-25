import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('FAQ'),
            subtitle: const Text('Frequently Asked Questions'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to FAQ screen or show FAQ dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Contact Support'),
            subtitle: const Text('Get in touch with our support team'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to contact support screen or show contact support dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('User Guide'),
            subtitle: const Text('How to use the app'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to user guide screen or show user guide dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Feedback'),
            subtitle: const Text('Send us your feedback'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to feedback screen or show feedback dialog
            },
          ),
        ],
      ),
    );
  }
}

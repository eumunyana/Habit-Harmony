import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Manage Permissions'),
            subtitle: const Text('Location, Camera, etc.'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to manage permissions screen or show permissions dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Data Usage'),
            subtitle: const Text('View and manage app data usage'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to data usage settings or show data usage dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Ad Preferences'),
            subtitle: const Text('Personalized ads settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to ad preferences settings or show ad preferences dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Account Activity'),
            subtitle: const Text('View recent activity'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to account activity settings or show account activity dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Security'),
            subtitle: const Text('Password and security settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to security settings or show security settings dialog
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GeneralSettingsScreen extends StatelessWidget {
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('English'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to language settings or show language selection dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Theme'),
            subtitle: const Text('System Default'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to theme settings or show theme selection dialog
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Enable Animations'),
            value: true,
            onChanged: (bool value) {
              // Toggle animations setting
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Backup Data'),
            subtitle: const Text('Automatic'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to backup settings or show backup options dialog
            },
          ),
        ],
      ),
    );
  }
}

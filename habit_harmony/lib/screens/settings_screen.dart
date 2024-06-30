import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:habit_harmony/providers/appthemenotifier.dart'; // Import theme notifier

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          ListTile(
            leading: const Icon(Icons.lightbulb_outline),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkModeEnabled = value;
                  _toggleDarkMode(value);
                });
              },
            ),
          ),
          const Divider(),
          _buildSettingsOption(
            Icons.settings,
            'General Settings',
            () {
              // Navigate to general settings screen or perform action
              _navigateToSettings('General Settings');
            },
          ),
          _buildSettingsOption(
            Icons.notifications,
            'Notifications',
            () {
              // Navigate to notifications settings screen or perform action
              _navigateToSettings('Notifications');
            },
          ),
          _buildSettingsOption(
            Icons.privacy_tip,
            'Privacy',
            () {
              // Navigate to privacy settings screen or perform action
              _navigateToSettings('Privacy');
            },
          ),
          _buildSettingsOption(
            Icons.account_circle,
            'Account',
            () {
              // Navigate to account settings screen or perform action
              _navigateToSettings('Account');
            },
          ),
          _buildSettingsOption(
            Icons.help,
            'Help',
            () {
              // Navigate to help screen or perform action
              _navigateToSettings('Help');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(IconData icon, String title, void Function() onTap) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: onTap,
  );
  }

  void _toggleDarkMode(bool value) {
    var themeMode = value ? ThemeMode.dark : ThemeMode.light;
    Provider.of<AppThemeNotifier>(context, listen: false).updateTheme(themeMode);
  }

  void _navigateToSettings(String settingsName) {
    // Implement navigation logic here, e.g., use Navigator to push a new screen
    // Example:
    Navigator.pushNamed(context, '/$settingsName');
    print('Navigating to $settingsName settings...');
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:habit_harmony/providers/appthemenotifier.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
              _navigateToSettings('/general_settings');
            },
          ),
          _buildSettingsOption(
            Icons.notifications,
            'Notifications',
            () {
              _navigateToSettings('/notifications');
            },
          ),
          _buildSettingsOption(
            Icons.privacy_tip,
            'Privacy',
            () {
              _navigateToSettings('/privacy');
            },
          ),
          _buildSettingsOption(
            Icons.account_circle,
            'Account',
            () {
              _navigateToSettings('/account');
            },
          ),
          _buildSettingsOption(
            Icons.help,
            'Help',
            () {
              _navigateToSettings('/help');
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

  void _navigateToSettings(String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}

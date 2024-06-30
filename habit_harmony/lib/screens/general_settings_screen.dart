import 'package:flutter/material.dart';

class GeneralSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Language'),
            subtitle: Text('English'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to language settings or show language selection dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Theme'),
            subtitle: Text('System Default'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to theme settings or show theme selection dialog
            },
          ),
          Divider(),
          SwitchListTile(
            title: Text('Enable Animations'),
            value: true,
            onChanged: (bool value) {
              // Toggle animations setting
            },
          ),
          Divider(),
          ListTile(
            title: Text('Backup Data'),
            subtitle: Text('Automatic'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to backup settings or show backup options dialog
            },
          ),
        ],
      ),
    );
  }
}

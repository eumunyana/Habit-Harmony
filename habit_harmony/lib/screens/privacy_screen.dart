import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Manage Permissions'),
            subtitle: Text('Location, Camera, etc.'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to manage permissions screen or show permissions dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Data Usage'),
            subtitle: Text('View and manage app data usage'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to data usage settings or show data usage dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Ad Preferences'),
            subtitle: Text('Personalized ads settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to ad preferences settings or show ad preferences dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Account Activity'),
            subtitle: Text('View recent activity'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to account activity settings or show account activity dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Security'),
            subtitle: Text('Password and security settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to security settings or show security settings dialog
            },
          ),
        ],
      ),
    );
  }
}

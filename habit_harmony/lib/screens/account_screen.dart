import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Profile Information'),
            subtitle: Text('View and edit profile'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to profile information settings or show profile information dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/password_reset');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Connected Accounts'),
            subtitle: Text('Manage linked accounts'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to connected accounts settings or show connected accounts dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Delete Account'),
            subtitle: Text('Permanently delete your account'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to delete account settings or show delete account dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Login'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Sign Up'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ],
      ),
    );
  }
}

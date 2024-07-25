import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Profile Information'),
            subtitle: const Text('View and edit profile'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to profile information settings or show profile information dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/password_reset');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Connected Accounts'),
            subtitle: const Text('Manage linked accounts'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to connected accounts settings or show connected accounts dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Delete Account'),
            subtitle: const Text('Permanently delete your account'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to delete account settings or show delete account dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Login'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Sign Up'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('FAQ'),
            subtitle: Text('Frequently Asked Questions'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to FAQ screen or show FAQ dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Contact Support'),
            subtitle: Text('Get in touch with our support team'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to contact support screen or show contact support dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('User Guide'),
            subtitle: Text('How to use the app'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to user guide screen or show user guide dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Feedback'),
            subtitle: Text('Send us your feedback'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to feedback screen or show feedback dialog
            },
          ),
        ],
      ),
    );
  }
}

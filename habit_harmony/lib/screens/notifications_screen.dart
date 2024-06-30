import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _reminderNotificationsEnabled = true;
  bool _achievementNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text('Reminder Notifications'),
            value: _reminderNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _reminderNotificationsEnabled = value;
              });
            },
          ),
          Divider(),
          SwitchListTile(
            title: Text('Achievement Notifications'),
            value: _achievementNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _achievementNotificationsEnabled = value;
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text('Notification Sound'),
            subtitle: Text('Default'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to notification sound settings or show sound selection dialog
            },
          ),
          Divider(),
          ListTile(
            title: Text('Do Not Disturb'),
            subtitle: Text('Off'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Do Not Disturb settings or show Do Not Disturb options dialog
            },
          ),
        ],
      ),
    );
  }
}

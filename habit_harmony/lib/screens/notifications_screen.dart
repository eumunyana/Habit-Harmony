import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

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
        title: const Text('Notifications Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Reminder Notifications'),
            value: _reminderNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _reminderNotificationsEnabled = value;
              });
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Achievement Notifications'),
            value: _achievementNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _achievementNotificationsEnabled = value;
              });
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Notification Sound'),
            subtitle: const Text('Default'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to notification sound settings or show sound selection dialog
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Do Not Disturb'),
            subtitle: const Text('Off'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Do Not Disturb settings or show Do Not Disturb options dialog
            },
          ),
        ],
      ),
    );
  }
}

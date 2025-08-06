import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _navigateToProfile(BuildContext context) {
    // TODO: Navigate to Profile screen
  }

  void _navigateToAbout(BuildContext context) {
    // TODO: Navigate to About screen
  }

  void _logout(BuildContext context) {
    // TODO: Show confirmation and handle logout
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => _navigateToProfile(context),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () => _navigateToAbout(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}

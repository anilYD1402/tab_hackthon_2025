import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _navigateToProfile(BuildContext context) {
    // TODO: Navigate to Profile screen
  }

  void _navigateToAbout(BuildContext context) {
    // TODO: Navigate to About screen
  }

  void _navigateToNotifications(BuildContext context) {
    // TODO: Navigate to Notifications screen
  }

  void _navigateToLanguage(BuildContext context) {
    // TODO: Navigate to Language selection screen
  }

  void _navigateToPrivacyPolicy(BuildContext context) {
    // TODO: Navigate to Privacy Policy screen
  }

  void _navigateToHelpSupport(BuildContext context) {
    // TODO: Navigate to Help & Support screen
  }

  void _logout(BuildContext context) {
    // TODO: Show confirmation and handle logout
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => _navigateToProfile(context),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () => _navigateToNotifications(context),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            onTap: () => _navigateToLanguage(context),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            onTap: () => _navigateToPrivacyPolicy(context),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () => _navigateToHelpSupport(context),
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

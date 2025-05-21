import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        Text('App Settings', style: textTheme.headlineSmall?.copyWith(color: colorScheme.primary)),
        const SizedBox(height: 20),
        ListTile(
          leading: const Icon(Icons.palette_outlined),
          title: Text('Appearance', style: textTheme.titleMedium),
          subtitle: Text('Change theme, colors, and more', style: textTheme.bodySmall),
          onTap: () {
             ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigate to Appearance Settings (Not Implemented)')),
              );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: Text('Notifications', style: textTheme.titleMedium),
          subtitle: Text('Manage notification preferences', style: textTheme.bodySmall),
          onTap: () {
             ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigate to Notification Settings (Not Implemented)')),
              );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: Text('Privacy & Security', style: textTheme.titleMedium),
          subtitle: Text('Control your data and security settings', style: textTheme.bodySmall),
          onTap: () {
             ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigate to Privacy Settings (Not Implemented)')),
              );
          },
        ),
        const Divider(),
        SwitchListTile(
          title: Text('Enable Dark Mode (System)', style: textTheme.titleMedium),
          subtitle: Text('Uses system setting. Manual toggle can be added here.', style: textTheme.bodySmall),
          value: Theme.of(context).brightness == Brightness.dark, // Example, not a real toggle
          onChanged: (bool value) {
            // This would ideally trigger a theme change via a provider
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Theme toggle not fully implemented here. Set via System.')),
            );
          },
          secondary: const Icon(Icons.brightness_6_outlined),
        ),
      ],
    );
  }
}

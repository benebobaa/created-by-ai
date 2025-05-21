import 'package:flutter/material.dart';
import 'package:flutter_sample/src/core/theme/app_theme.dart'; // Adjust project name

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Welcome to Your Dashboard!', style: textTheme.headlineMedium?.copyWith(color: colorScheme.primary)),
          const SizedBox(height: 16),
          Text(
            'This is a sample dashboard page showing some UI elements and theming. '
            'It uses styles from the AppTheme, including custom typography and colors.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          // Example of using a Card with theme styling
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Project Overview', style: textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text('Here you might display some key project metrics or quick links.', style: textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Action for the button
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Overview button pressed!')),
                      );
                    },
                    child: const Text('View Details'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Sample Image from Assets:', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          // Display the sample image
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/sample_image.png'), // Ensure this path is correct
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            // child: Image.asset('assets/images/sample_image.png', fit: BoxFit.cover), // Alternative
          ),
          const SizedBox(height: 16),
          Text(
            'The card and button above use styles defined in AppTheme. '
            'The image is loaded from the assets folder.',
            style: textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

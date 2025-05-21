import 'package:flutter/material.dart';

class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10, // Example item count
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          elevation: 2.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              child: Text('${index + 1}', style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer)),
            ),
            title: Text('Feed Item ${index + 1}', style: textTheme.titleMedium),
            subtitle: Text('This is a description for feed item ${index + 1}. It demonstrates a scrollable list of cards.', style: textTheme.bodySmall),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on Feed Item ${index + 1}')),
              );
            },
          ),
        );
      },
    );
  }
}

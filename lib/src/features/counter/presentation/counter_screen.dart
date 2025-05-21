import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/counter_provider.dart'; // Adjust import path as necessary

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Watch the provider to get the current state
    // Using ref.watch will rebuild the widget when the state changes
    final int count = ref.watch(counterProvider);

    // To call methods on the notifier, we first read the notifier itself
    final CounterNotifier counterNotifier = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              textAlign: TextAlign.center,
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'decrement_counter', // Unique heroTag
                  onPressed: () {
                    // Call the decrement method on the notifier
                    counterNotifier.decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  heroTag: 'increment_counter', // Unique heroTag
                  onPressed: () {
                    // Call the increment method on the notifier
                    counterNotifier.increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counterNotifier.reset();
              },
              child: const Text('Reset'),
            )
          ],
        ),
      ),
    );
  }
}

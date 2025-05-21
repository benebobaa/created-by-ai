import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Define the state (simple integer for a counter)
// No special class needed if state is simple like int or String.

// 2. Create a Notifier (StateNotifier is good for simple to medium complexity state)
class CounterNotifier extends StateNotifier<int> {
  // Initialize the state in the constructor
  CounterNotifier() : super(0); // Initial count is 0

  // Method to increment the counter
  void increment() {
    state = state + 1;
  }

  // Method to decrement the counter
  void decrement() {
    if (state > 0) { // Optional: prevent negative count
      state = state - 1;
    }
  }

  // Method to reset the counter
  void reset() {
    state = 0;
  }
}

// 3. Create a Provider
// StateNotifierProvider is used to provide an instance of CounterNotifier
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

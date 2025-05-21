import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/src/app.dart'; // Assuming 'flutter_sample' is the project name from pubspec.yaml

// It's good practice to ensure Flutter bindings are initialized,
// especially if you need to use platform channels or other async operations
// before runApp.
void main() async { // Make main async
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized

  runApp(
    const ProviderScope( // Wrap the entire application in a ProviderScope
      child: AppWidget(), // This will be our new root widget
    ),
  );
}

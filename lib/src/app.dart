import 'package:flutter/material.dart';
import 'package:flutter_sample/src/core/router/app_router.dart'; // Adjust if project name is different
import 'package:flutter_sample/src/core/theme/app_theme.dart';   // Adjust if project name is different

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Pro Setup', // You can change this title
      
      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Automatically switch based on system settings for now
                                   // Could be managed by a Riverpod provider later for in-app switching

      // Router configuration
      routerConfig: AppRouter.router,

      // Debug banner
      debugShowCheckedModeBanner: false, // Set to true if you want the debug banner

      // Localization and other global configurations can be added here if needed
      // localizationsDelegates: [ ... ],
      // supportedLocales: [ ... ],
    );
  }
}

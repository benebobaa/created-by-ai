import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/counter/presentation/counter_screen.dart';
import '../../features/dashboard/presentation/home_shell.dart';
import '../../features/dashboard/presentation/dashboard_tab.dart';
import '../../features/feed/presentation/feed_tab.dart';
import '../../features/settings/presentation/settings_tab.dart';
import '../../features/auth/presentation/login_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  // Removed _shellNavigatorKey as it's not explicitly used in the new structure with multiple branch navigator keys.
  // Each StatefulShellBranch will have its own navigatorKey.

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login', // Initial route
    debugLogDiagnostics: true, // Enable for debugging
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
      ),
      // Main application shell with BottomNavigationBar
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
          // Return the widget that implements the shell (HomeShell)
          return HomeShell(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // Branch for the 'Dashboard' tab
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'dashboardTabNav'), // Unique key for this tab's navigator
            routes: <RouteBase>[
              GoRoute(
                path: '/home/dashboard',
                name: 'dashboard',
                builder: (BuildContext context, GoRouterState state) => const DashboardTab(),
              ),
            ],
          ),
          // Branch for the 'Feed' tab
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'feedTabNav'),
            routes: <RouteBase>[
              GoRoute(
                path: '/home/feed',
                name: 'feed',
                builder: (BuildContext context, GoRouterState state) => const FeedTab(),
                // Example of a sub-route within a tab (can be uncommented and used later)
                // routes: <RouteBase>[
                //   GoRoute(
                //     path: 'details/:itemId',
                //     name: 'feedItemDetails',
                //     builder: (BuildContext context, GoRouterState state) {
                //       final String itemId = state.pathParameters['itemId']!;
                //       return Center(child: Text('Feed Item Details: $itemId (Placeholder)'));
                //     },
                //   ),
                // ],
              ),
            ],
          ),
          // Branch for the 'Settings' tab
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'settingsTabNav'),
            routes: <RouteBase>[
              GoRoute(
                path: '/home/settings',
                name: 'settings',
                builder: (BuildContext context, GoRouterState state) => const SettingsTab(),
              ),
            ],
          ),
        ],
      ),
      // Route for the CounterScreen (remains unchanged)
      GoRoute(
        path: '/counter',
        name: 'counter',
        builder: (BuildContext context, GoRouterState state) => const CounterScreen(),
      ),
      // Example of a route outside the shell (can be uncommented and used later)
      // GoRoute(
      //   path: '/onboarding',
      //   name: 'onboarding',
      //   builder: (BuildContext context, GoRouterState state) => const Center(child: Text('Onboarding (Placeholder)')),
      // ),
    ],
    // errorBuilder: (context, state) => ErrorScreen(error: state.error), // Optional: Custom error screen
  );
}

// It's good practice to define route names as constants if they are used frequently for navigation.
// class AppRoutePaths {
//   static const String dashboard = '/home/dashboard';
//   static const String feed = '/home/feed';
//   static const String settings = '/home/settings';
//   static String feedItemDetails(String itemId) => '/home/feed/details/$itemId';
//   static const String onboarding = '/onboarding';
//   static const String counter = '/counter';
// }

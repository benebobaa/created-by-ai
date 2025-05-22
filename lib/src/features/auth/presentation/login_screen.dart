import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/auth_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/router/app_router.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    
    if (authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/home/dashboard');
      });
    }

    return Scaffold(
      // Removed AppBar to match screenshot
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80), // Increased space for logo
                // Add logo and title
                Image.asset(
                  'assets/images/cignifi_logo.png', // Assuming logo is in assets/images
                  height: 50,
                ),
                const SizedBox(height: 40),
                Text(
                  'Login to your Account',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    // Removed prefixIcon to match screenshot
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Keep rounded corners
                      borderSide: BorderSide.none, // Remove border line
                    ),
                    filled: true, // Add fill color
                    fillColor: Colors.grey[200], // Light grey fill color
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Adjusted padding
                  ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    // Removed prefixIcon to match screenshot
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Keep rounded corners
                      borderSide: BorderSide.none, // Remove border line
                    ),
                    filled: true, // Add fill color
                    fillColor: Colors.grey[200], // Light grey fill color
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Adjusted padding
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_passwordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
                if (authState.error != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      authState.error!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16), // Adjusted padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Keep rounded corners
                    ),
                    backgroundColor: Colors.blue[900], // Dark blue color
                    foregroundColor: Colors.white, // White text color
                  ),
                  onPressed: authState.isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            await authNotifier.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                  child: authState.isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          'Sign in', // Changed text to 'Sign in'
                          style: TextStyle(fontSize: 16),
                        ),
                ),
                const SizedBox(height: 32), // Increased space

                // Add 'Or sign in with' section
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '- Or sign in with -',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 24),

                // Add social sign-in buttons (placeholders)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Image.asset('assets/images/google_logo.png', height: 24), // Placeholder
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Image.asset('assets/images/facebook_logo.png', height: 24), // Placeholder
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Image.asset('assets/images/twitter_logo.png', height: 24), // Placeholder
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40), // Increased space

                // Add 'Don't have an account? Sign up' text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to Sign Up screen
                      },
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    ));
  }
}
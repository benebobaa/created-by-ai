import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    
    // Mock authentication
    await Future.delayed(const Duration(seconds: 1));
    
    if (email == 'test@example.com' && password == 'password') {
      state = state.copyWith(isLoading: false, isAuthenticated: true);
    } else {
      state = state.copyWith(
        isLoading: false,
        error: 'Invalid credentials',
      );
    }
  }

  void logout() {
    state = const AuthState();
  }
}

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
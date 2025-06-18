import 'dart:convert';
import 'package:do_it/models/user_model.dart';
import 'package:do_it/repo/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  throw UnimplementedError(
    'Initialize in main.dart with SharedPreferences instance',
  );
});

final authStateProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<UserModel?>>((ref) {
      return AuthNotifier(ref.watch(authRepositoryProvider));
    });

class AuthNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository _repository;
  static const String _userKey = 'user_key';

  AuthNotifier(this._repository) : super(const AsyncValue.data(null)) {
    _loadUser();
    _initializeAuth();
  }

  // Initialize Auth State
  Future<void> _initializeAuth() async {
    if (_repository.isLoggedIn()) {
      final user = await _repository.getCurrentUser();
      state = AsyncValue.data(user);
    } else {
      state = const AsyncValue.data(null);
    }
  }

  // Load User from SharedPreferences
  Future<void> _loadUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(_userKey);
      if (userJson != null) {
        state = AsyncValue.data(UserModel.fromJson(jsonDecode(userJson)));
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Register User
  Future<bool> register(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    state = const AsyncValue.loading();
    try {
      final user = UserModel(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      final result = await _repository.register(user);
      if (result) {
        state = AsyncValue.data(user);
      }
      return result;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  // Login User
  Future<bool> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.login(email, password);
      if (result) {
        await _loadUser(); // Reload user data after successful login
      }
      return result;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  // Logout User
  Future<void> logout() async {
    await _repository.logout();
    state = const AsyncValue.data(null);
  }
}

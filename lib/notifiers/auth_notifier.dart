import 'package:do_it/models/user_model.dart';
import 'package:do_it/repo/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  throw UnimplementedError(
    'Initialize in main.dart with SharedPreferences instance',
  );
});

final authStateProvider = StateNotifierProvider<AuthNotifier, AsyncValue<bool>>(
  (ref) {
    return AuthNotifier(ref.watch(authRepositoryProvider));
  },
);

class AuthNotifier extends StateNotifier<AsyncValue<bool>> {
  final AuthRepository _repository;

  AuthNotifier(this._repository)
    : super(AsyncValue.data(_repository.isLoggedIn()));

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
      state = AsyncValue.data(result);
      return result;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.login(email, password);
      state = AsyncValue.data(result);
      return result;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AsyncValue.data(false);
  }
}

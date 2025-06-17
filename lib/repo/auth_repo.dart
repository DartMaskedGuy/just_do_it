import 'dart:convert';
import 'package:do_it/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static const String _userKey = 'user_key';
  static const String _isLoggedInKey = 'is_logged_in';

  final SharedPreferences _prefs;

  AuthRepository(this._prefs);

  Future<bool> register(UserModel user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await _prefs.setString(_userKey, userJson);
      await _prefs.setBool(_isLoggedInKey, true);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final userJson = _prefs.getString(_userKey);
      if (userJson != null) {
        final user = UserModel.fromJson(jsonDecode(userJson));
        if (user.email == email && user.password == password) {
          await _prefs.setBool(_isLoggedInKey, true);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    await _prefs.setBool(_isLoggedInKey, false);
  }

  bool isLoggedIn() {
    return _prefs.getBool(_isLoggedInKey) ?? false;
  }
}

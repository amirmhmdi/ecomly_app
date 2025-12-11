import 'package:ecomly_app/core/commen/singletons/cache.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecomly_app/core/commen/extensions/theme_mode_extension.dart';
import 'package:ecomly_app/core/commen/extensions/string_extension.dart';

class CacheHelper {
  final SharedPreferences _prefs;
  CacheHelper(this._prefs);

  static const String _sessionTokenKey = "sesstion_token_key";
  static const String _userIdKey = "user_id_key";
  static const String _themeModeKey = "theme_mode_key";
  static const String _firstTimeKey = "first_time_key";

  Future<bool> cacheSessionToken(String token) async {
    try {
      final result = await _prefs.setString(_sessionTokenKey, token);
      Cache.instance.setSessionToken(token);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> cacheUserId(String userId) async {
    try {
      final result = _prefs.setString(_userIdKey, userId);
      Cache.instance.setUserId(userId);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<void> cacheFirstTime() async {
    await _prefs.setBool(_firstTimeKey, true);
  }

  Future<void> cacheThemeMode(ThemeMode themeMode) async {
    await _prefs.setString(_themeModeKey, themeMode.StringValue);
    Cache.instance.setThemeMode(themeMode);
  }

  String? getSessionToken() {
    String? sessionToken = _prefs.getString(_sessionTokenKey);
    if (sessionToken case String()) {
      Cache.instance.setSessionToken(sessionToken);
    } else {
      debugPrint("Get Session token failed");
    }
    return sessionToken;
  }

  String? getUserId() {
    String? userId = _prefs.getString(_userIdKey);
    if (userId case String()) {
      Cache.instance.setUserId(userId);
    } else {
      debugPrint("Get UserId failed");
    }
    return userId;
  }

  ThemeMode getThemeMode() {
    final themeModeStringValue = _prefs.getString(_themeModeKey);
    final themeMode = themeModeStringValue?.toThemeMode ?? ThemeMode.system;
    Cache.instance.setThemeMode(themeMode);
    return themeMode;
  }

  Future<void> resetSession() async {
    await _prefs.remove(_sessionTokenKey);
    await _prefs.remove(_userIdKey);
    Cache.instance.reset();
  }

  bool isFirstTime() => _prefs.getBool(_firstTimeKey) ?? true;
}

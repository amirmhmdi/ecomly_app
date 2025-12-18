import 'package:flutter/material.dart';

class Cache {
  Cache._internal();

  static final Cache instance = Cache._internal();

  String? _sessionToken;
  String? _userId;
  final themeModeNotifier = ValueNotifier(ThemeMode.system);

  String? get sessionToken => _sessionToken;
  String? get userId => _userId;

  void setSessionToken(String? value) {
    if (value != _sessionToken) _sessionToken = value;
  }

  void setUserId(String? value) {
    if (value != _userId) _userId = value;
  }

  void setThemeMode(ThemeMode themeMode) {
    if (themeMode != themeModeNotifier.value) {
      themeModeNotifier.value = themeMode;
    }
  }

  void reset() {
    setSessionToken(null);
    setUserId(null);
  }
}

import 'package:flutter/material.dart';

extension themModeExt on ThemeMode {
  String get StringValue {
    return switch (this) {
      ThemeMode.light => "light",
      ThemeMode.dark => "dark",
      _ => "system",
    };
  }
}

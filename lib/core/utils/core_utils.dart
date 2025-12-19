import 'package:ecomly_app/core/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class CoreUtils {
  const CoreUtils();

  static postFrameCallback(VoidCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static Color adaptiveColour(
    BuildContext context, {
    required Color lightModeColour,
    required Color darkModeColour,
  }) {
    return context.isDarkMode ? darkModeColour : lightModeColour;
  }
}

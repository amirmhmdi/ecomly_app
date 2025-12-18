import 'package:ecomly_app/core/utils/constants/network_constants.dart';

abstract class ApiUrls {
  const ApiUrls();

  static String get registerEndpoint => "${NetworkConstants.baseUrl}/register";
  static String get loginEndpoint => "${NetworkConstants.baseUrl}/login";
  static String get forgotPasswordEndpoint =>
      "${NetworkConstants.baseUrl}/forgot-password";
  static String get verifyOtpEndpoint =>
      "${NetworkConstants.baseUrl}/verify-otp";
  static String get resetPasswordEndpoint =>
      "${NetworkConstants.baseUrl}/reset-password";
  static String get verifyTokenEndpoint =>
      "${NetworkConstants.baseUrl}/verify-token";
}

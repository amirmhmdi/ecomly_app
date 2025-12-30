part of 'auth_adapter.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitialState extends AuthState {
  const AuthInitialState();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class OtpSent extends AuthState {
  const OtpSent();
}

final class LoggedIn extends AuthState {
  const LoggedIn(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

final class Registered extends AuthState {
  const Registered();
}

final class PasswordReset extends AuthState {
  const PasswordReset();
}

final class OtpVerified extends AuthState {
  const OtpVerified();
}

final class TokenVerified extends AuthState {
  const TokenVerified(this.isValid);

  final bool isValid;

  @override
  List<Object> get props => [isValid];
}

final class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

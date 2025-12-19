import 'package:ecomly_app/core/common/app/riverpod/current_user_provider.dart';
import 'package:ecomly_app/core/common/entities/user.dart';
import 'package:ecomly_app/core/services/injection_container.dart';
import 'package:ecomly_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/verify_token_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.dart';
part 'auth_adapter.g.dart';

@riverpod
class AuthAdapter extends _$AuthAdapter {
  @override
  AuthState build() {
    _forgotPasswordUsecase = sl<ForgotPasswordUsecase>();
    _loginUsecase = sl<LoginUsecase>();
    _registerUsecase = sl<RegisterUsecase>();
    _resetPasswordUsecase = sl<ResetPasswordUsecase>();
    _verifyOtpUsecase = sl<VerifyOtpUsecase>();
    _verifyTokenUsecase = sl<VerifyTokenUsecase>();
    return AuthInitialState();
  }

  late ForgotPasswordUsecase _forgotPasswordUsecase;
  late LoginUsecase _loginUsecase;
  late RegisterUsecase _registerUsecase;
  late ResetPasswordUsecase _resetPasswordUsecase;
  late VerifyOtpUsecase _verifyOtpUsecase;
  late VerifyTokenUsecase _verifyTokenUsecase;

  Future<void> login({required String email, required String password}) async {
    state = const AuthLoading();
    final result = await _loginUsecase.call(LoginParams(email, password));
    result.fold((failure) => state = AuthError(failure.message), (user) {
      ref.read(currentUserProvider.notifier).setUser(user);
      state = LoggedIn(user);
    });
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    state = const AuthLoading();
    final result = await _registerUsecase.call(
      RegisterParams(
        name: name,
        password: password,
        email: email,
        phone: phone,
      ),
    );
    result.fold(
      (failure) => state = AuthError(failure.message),
      (_) => const Registered(),
    );
  }

  Future<void> forgotPassword({required String email}) async {
    state = const AuthLoading();
    final result = await _forgotPasswordUsecase.call(email);
    result.fold(
      (failure) => state = AuthError(failure.message),
      (_) => state = OtpSent(),
    );
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    state = const AuthLoading();
    final result = await _verifyOtpUsecase.call(VerifyOtpParams(email, otp));
    result.fold(
      (failure) => state = AuthError(failure.message),
      (_) => state = const OtpVerified(),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    state = const AuthLoading();
    final result = await _resetPasswordUsecase.call(
      ResetPasswordParams(email, newPassword),
    );
    result.fold(
      (failure) => state = AuthError(failure.message),
      (_) => state = const PasswordReset(),
    );
  }

  Future<void> verifyToken() async {
    state = const AuthLoading();
    final result = await _verifyTokenUsecase.call();
    result.fold((failure) => state = AuthError(failure.message), (isValid) {
      state = TokenVerified(isValid);
      if (!isValid) ref.read(currentUserProvider.notifier).setUser(null);
    });
  }
}

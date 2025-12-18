import 'package:ecomly_app/core/common/models/user_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  });

  Future<UserModel> login({required String email, required String password});

  Future<void> forgotPassword(String email);

  Future<void> verifyOTP({required String email, required String otp});

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  });

  Future<bool> verifyToken();
}

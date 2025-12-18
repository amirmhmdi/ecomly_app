import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:ecomly_app/core/common/entities/user.dart';
import 'package:ecomly_app/core/common/models/user_model.dart';
import 'package:ecomly_app/core/errors/exceptions.dart';
import 'package:ecomly_app/core/errors/failures.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecomly_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoriesImpl implements AuthRepository {
  const AuthRepositoriesImpl(this._authRemoteDataSource);
  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  ResultFuture<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      await _authRemoteDataSource.register(
        name: name,
        password: password,
        email: email,
        phone: phone,
      );
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<bool> verifyToken() async {
    try {
      bool result = await _authRemoteDataSource.verifyToken();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      await _authRemoteDataSource.resetPassword(
        email: email,
        newPassword: newPassword,
      );
      return right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      _authRemoteDataSource.verifyOTP(email: email, otp: otp);
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> forgotPassword(String email) async {
    try {
      await _authRemoteDataSource.forgotPassword(email);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authRemoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}

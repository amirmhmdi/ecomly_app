import 'dart:convert';

import 'package:ecomly_app/core/common/app/cache_helper.dart';
import 'package:ecomly_app/core/common/extensions/string_extension.dart';
import 'package:ecomly_app/core/common/models/user_model.dart';
import 'package:ecomly_app/core/common/singletons/cache.dart';
import 'package:ecomly_app/core/errors/error_response.dart';
import 'package:ecomly_app/core/errors/exceptions.dart';
import 'package:ecomly_app/core/services/injection_container.dart';
import 'package:ecomly_app/core/utils/api_urls.dart';
import 'package:ecomly_app/core/utils/constants/network_constants.dart';
import 'package:ecomly_app/core/utils/network_utils.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._client);
  final http.Client _client;

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final uri = Uri.parse(ApiUrls.registerEndpoint);
      final response = await _client.post(
        uri,
        body: jsonEncode(email),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200) {
        final payload = jsonDecode(response.body);
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final uri = Uri.parse(ApiUrls.loginEndpoint);
      final response = await _client.post(
        uri,
        body: jsonEncode({"password": password, "email": email}),
        headers: NetworkConstants.headers,
      );
      final payload = jsonDecode(response.body) as DataMap;
      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
      sl<CacheHelper>().cacheSessionToken(payload['accessToken']);
      final user = UserModel.fromMap(payload);
      sl<CacheHelper>().cacheUserId(user.id);
      return user;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      final uri = Uri.parse(ApiUrls.registerEndpoint);
      final response = await _client.post(
        uri,
        body: jsonEncode({
          "name": name,
          "password": password,
          "email": email,
          "phone": phone,
        }),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final uri = Uri.parse(ApiUrls.resetPasswordEndpoint);
      final response = await _client.post(
        uri,
        body: jsonEncode({"email": email, "newPassword": newPassword}),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200) {
        final payload = jsonDecode(response.body);
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<void> verifyOTP({required String email, required String otp}) async {
    try {
      final uri = Uri.parse(ApiUrls.verifyOtpEndpoint);
      final response = await _client.post(
        uri,
        body: jsonEncode({"email": email, "otp": otp}),
        headers: NetworkConstants.headers,
      );
      if (response.statusCode != 200) {
        final payload = jsonDecode(response.body);
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<bool> verifyToken() async {
    try {
      final uri = Uri.parse(ApiUrls.verifyTokenEndpoint);
      final response = await _client.get(
        uri,
        headers: Cache.instance.sessionToken!.toAuthHeader,
      );
      final payload = jsonDecode(response.body);
      await NetworkUtils.renewToken(response);
      if (response.statusCode != 200) {
        payload as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errorResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
      return payload as bool;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
}

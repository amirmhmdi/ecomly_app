part of 'user_remote_datasource.dart';

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  const UserRemoteDatasourceImpl(this._client);

  final http.Client _client;

  @override
  Future<UserModel> getUser(String userId) async {
    try {
      final uri = Uri.parse(ApiUrls.usersEndpoint(userId));
      final response = await _client.get(
        uri,
        headers: Cache.instance.sessionToken!.toAuthHeader,
      );
      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);
      if (response.statusCode != 200) {
        final errroResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errroResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
      return UserModel.fromMap(payload);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<String> getPaymentProfile(String userId) async {
    try {
      final uri = Uri.parse(ApiUrls.usersEndpoint("$userId/paymentProfile"));
      final response = await _client.get(
        uri,
        headers: Cache.instance.sessionToken!.toAuthHeader,
      );
      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);
      if (response.statusCode != 200) {
        final errroResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errroResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
      return payload['url'] as String;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<UserModel> updateUser({
    required String userId,
    required DataMap updateUser,
  }) async {
    try {
      final uri = Uri.parse(ApiUrls.usersEndpoint(userId));
      final response = await _client.put(
        uri,
        body: jsonEncode(updateUser),
        headers: Cache.instance.sessionToken!.toAuthHeader,
      );
      final payload = jsonDecode(response.body) as DataMap;
      await NetworkUtils.renewToken(response);
      if (response.statusCode != 200 && response.statusCode != 201) {
        final errroResponse = ErrorResponse.fromMap(payload);
        throw ServerException(
          message: errroResponse.errorMessage,
          statusCode: response.statusCode,
        );
      }
      return UserModel.fromMap(payload);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 500);
    }
  }
}

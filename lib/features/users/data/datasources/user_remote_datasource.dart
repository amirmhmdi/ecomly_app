import 'dart:convert';

import 'package:ecomly_app/core/common/extensions/string_extension.dart';
import 'package:ecomly_app/core/common/models/user_model.dart';
import 'package:ecomly_app/core/common/singletons/cache.dart';
import 'package:ecomly_app/core/errors/error_response.dart';
import 'package:ecomly_app/core/errors/exceptions.dart';
import 'package:ecomly_app/core/utils/api_urls.dart';
import 'package:ecomly_app/core/utils/network_utils.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

part 'user_remote_datasource_impl.dart';

abstract class UserRemoteDatasource {
  const UserRemoteDatasource();

  Future<UserModel> getUser(String userId);
  Future<UserModel> updateUser({
    required String userId,
    required DataMap updateUser,
  });

  Future<String> getPaymentProfile(String userId);
}

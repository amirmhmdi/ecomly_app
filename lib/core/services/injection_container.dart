import 'package:ecomly_app/core/common/app/cache_helper.dart';
import 'package:ecomly_app/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:ecomly_app/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:ecomly_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:ecomly_app/features/auth/domain/usecases/verify_token_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'injection_container.main.dart';

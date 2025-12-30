part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _cacheInit();
  await _authInit();
}

Future<void> _cacheInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => CacheHelper(sl()));
}

Future<void> _authInit() async {
  sl
    ..registerLazySingleton(() => ForgotPasswordUsecase(sl()))
    ..registerLazySingleton(() => LoginUsecase(sl()))
    ..registerLazySingleton(() => RegisterUsecase(sl()))
    ..registerLazySingleton(() => ResetPasswordUsecase(sl()))
    ..registerLazySingleton(() => VerifyOtpUsecase(sl()))
    ..registerLazySingleton(() => VerifyTokenUsecase(sl()))
    ..registerLazySingleton<AuthRepositoriesImpl>(
      () => AuthRepositoriesImpl(sl()),
    )
    ..registerLazySingleton<AuthRemoteDataSourceImpl>(
      () => AuthRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<http.Client>(http.Client.new);
}

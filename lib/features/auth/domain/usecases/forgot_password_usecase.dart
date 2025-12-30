import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUsecase extends UsecaseWithParams<void, String> {
  const ForgotPasswordUsecase(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}

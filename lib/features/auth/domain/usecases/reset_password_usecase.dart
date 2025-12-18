import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class ResetPasswordUsecase
    implements UsecaseWithParams<void, ResetPasswordParams> {
  final AuthRepository _repo;

  ResetPasswordUsecase(this._repo);

  @override
  ResultFuture<void> call(ResetPasswordParams params) =>
      _repo.resetPassword(email: params.email, newPassword: params.newPassword);
}

class ResetPasswordParams extends Equatable {
  final String email;
  final String newPassword;

  const ResetPasswordParams(this.email, this.newPassword);

  @override
  List<Object> get props => [email, newPassword];
}

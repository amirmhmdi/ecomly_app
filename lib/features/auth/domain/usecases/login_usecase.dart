import 'package:ecomly_app/core/common/entities/user.dart';
import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUsecase implements UsecaseWithParams<User, LoginParams> {
  LoginUsecase(this._repo);
  final AuthRepository _repo;

  @override
  ResultFuture<User> call(LoginParams params) =>
      _repo.login(email: params.email, password: params.password);
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

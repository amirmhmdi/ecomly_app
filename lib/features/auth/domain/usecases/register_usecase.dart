import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class RegisterUsecase implements UsecaseWithParams<void, RegisterParams> {
  RegisterUsecase(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(RegisterParams params) => _repo.register(
    name: params.name,
    password: params.password,
    email: params.email,
    phone: params.phone,
  );
}

class RegisterParams extends Equatable {
  final String name;
  final String password;
  final String email;
  final String phone;

  const RegisterParams({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });

  @override
  List<Object> get props => [name, password, email, phone];
}

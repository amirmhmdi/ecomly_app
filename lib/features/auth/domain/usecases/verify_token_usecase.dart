import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/auth/domain/repositories/auth_repository.dart';

class VerifyTokenUsecase implements UsecaseWithoutParams<bool> {
  final AuthRepository _repo;

  VerifyTokenUsecase(this._repo);

  @override
  ResultFuture<bool> call() => _repo.verifyToken();
}

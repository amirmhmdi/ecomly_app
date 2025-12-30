import 'package:ecomly_app/core/common/entities/user.dart';
import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/users/domin/repos/user_repo.dart';

class GetUserUsecase extends UsecaseWithParams<User, String> {
  const GetUserUsecase(this._repo);

  final UserRepo _repo;
  @override
  ResultFuture<User> call(String params) async => _repo.getUser(params);
}

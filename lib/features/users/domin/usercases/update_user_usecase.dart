import 'package:ecomly_app/core/common/entities/user.dart';
import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/users/domin/repos/user_repo.dart';
import 'package:equatable/equatable.dart';

abstract class UpdateUserUsecase
    extends UsecaseWithParams<User, UpdateUserUsecaseParams> {
  const UpdateUserUsecase(this._repo);
  final UserRepo _repo;

  @override
  ResultFuture<User> call(UpdateUserUsecaseParams params) =>
      _repo.updateUser(userId: params.userId, updateUser: params.updateUser);
}

class UpdateUserUsecaseParams extends Equatable {
  const UpdateUserUsecaseParams({
    required this.userId,
    required this.updateUser,
  });

  final String userId;
  final DataMap updateUser;

  @override
  List<Object> get props => [userId, updateUser];
}

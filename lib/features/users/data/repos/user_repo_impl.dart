import 'package:dartz/dartz.dart';
import 'package:ecomly_app/core/common/entities/user.dart';
import 'package:ecomly_app/core/errors/exceptions.dart';
import 'package:ecomly_app/core/errors/failures.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/users/data/datasources/user_remote_datasource.dart';
import 'package:ecomly_app/features/users/domin/repos/user_repo.dart';

class UserRepoImpl implements UserRepo {
  const UserRepoImpl(this._userRemoteDatasource);

  final UserRemoteDatasource _userRemoteDatasource;

  @override
  ResultFuture<User> getUser(String userId) async {
    try {
      final result = await _userRemoteDatasource.getUser(userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> updateUser({
    required String userId,
    required DataMap updateUser,
  }) async {
    try {
      final result = await _userRemoteDatasource.updateUser(
        userId: userId,
        updateUser: updateUser,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<String> getPaymentProfile(String userId) async {
    try {
      final result = await _userRemoteDatasource.getPaymentProfile(userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}

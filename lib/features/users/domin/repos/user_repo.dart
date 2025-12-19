import 'package:ecomly_app/core/common/entities/user.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';

abstract class UserRepo {
  const UserRepo();

  ResultFuture<User> getUser(String userId);
  ResultFuture<User> updateUser({
    required String userId,
    required DataMap updateUser,
  });

  ResultFuture<String> getPaymentProfile(String userId);
}

import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/users/domin/repos/user_repo.dart';

abstract class GetUserPaymentProfileUsecase
    extends UsecaseWithParams<String, String> {
  const GetUserPaymentProfileUsecase(this._repo);
  final UserRepo _repo;

  @override
  ResultFuture<String> call(String params) => _repo.getPaymentProfile(params);
}

import 'package:ecomly_app/core/usecase/usecase.dart';
import 'package:ecomly_app/core/utils/typedefs.dart';
import 'package:ecomly_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class VerifyOtpUsecase implements UsecaseWithParams<void, VerifyOtpParams> {
  final AuthRepository _repo;

  VerifyOtpUsecase(this._repo);

  @override
  ResultFuture<void> call(VerifyOtpParams params) =>
      _repo.verifyOTP(email: params.email, otp: params.otp);
}

class VerifyOtpParams extends Equatable {
  final String email;
  final String otp;

  const VerifyOtpParams(this.email, this.otp);

  @override
  List<Object> get props => [email, otp];
}

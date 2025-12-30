import 'package:ecomly_app/core/errors/exceptions.dart';
import 'package:equatable/equatable.dart';

sealed class Failures extends Equatable {
  final String message;
  final int statusCode;

  const Failures({required this.message, required this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failures {
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException e)
    : this(message: e.message, statusCode: e.statusCode);
}

class CacheFailure extends Failures {
  const CacheFailure({required super.message}) : super(statusCode: 3);

  CacheFailure.fromException(CacheException e) : this(message: e.message);
}

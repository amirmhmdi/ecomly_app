import 'package:ecomly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

typedef DataMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<Failures, T>>;

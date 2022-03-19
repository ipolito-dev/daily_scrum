import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseFuture<Type, Params> {
  Future<Either<FailureError, Type>> call({required Params params});
}

abstract class UseCaseSync<Type, Params> {
  Either<FailureError, Type> call({required Params params});
}

import 'package:dartz/dartz.dart';

abstract class UseCaseFuture<E extends Exception, T, P> {
  Future<Either<E, T>> call({required P params});
}

abstract class UseCaseSync<E extends Exception, T, P> {
  Either<E, T> call({required P params});
}

import 'package:dartz/dartz.dart';

abstract class UseCaseFuture<E extends Exception, T, P> {
  Future<Either<E, T>> call({P params});
}

abstract class UseCaseSync<T, P> {
  T call({P params});
}

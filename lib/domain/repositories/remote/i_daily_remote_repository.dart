import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:dartz/dartz.dart';

abstract class IDailyRemoteRepository {
  Future<Either<FailureError, List<DailyEntity>>> getDailys();
  Future<Either<FailureError, DailyEntity>> updateDaily(DailyEntity daily);
}

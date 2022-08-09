import 'package:daily_scrum/data/datasources/daily_datasource/i_daily_datasource.dart';
import 'package:daily_scrum/data/models/daily_model.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/repositories/remote/i_daily_remote_repository.dart';
import 'package:dartz/dartz.dart';

class DailyRepositoryImpl implements IDailyRemoteRepository {
  final IDailyDatasource datasource;
  DailyRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureError, List<DailyEntity>>> getDailys() async {
    try {
      final dailys = await datasource.getDailys();
      return Right(dailys);
    } on DatasourceError catch (e) {
      return Left(e);
    } on Exception {
      return Left(DatasourceError('DatasourceError error'));
    }
  }

  @override
  Future<Either<FailureError, DailyEntity>> updateDaily(
    DailyEntity dailyParam,
  ) async {
    try {
      final daily = await datasource.updateDaily(dailyParam as DailyModel);
      return Right(daily);
    } on DatasourceError catch (e) {
      return Left(e);
    } on Exception {
      return Left(DatasourceError('DatasourceError error'));
    }
  }
}

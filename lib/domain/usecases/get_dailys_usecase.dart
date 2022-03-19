import 'package:daily_scrum/core/usecases/usecase.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/repositories/remote/i_daily_remote_repository.dart';
import 'package:dartz/dartz.dart';

class GetDailysUsecase implements UseCaseFuture<List<DailyEntity>, void> {
  final IDailyRemoteRepository repository;

  GetDailysUsecase({required this.repository});

  @override
  Future<Either<FailureError, List<DailyEntity>>> call({params}) {
    return repository.getDailys();
  }
}

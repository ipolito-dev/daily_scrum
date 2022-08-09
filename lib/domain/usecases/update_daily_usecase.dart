import 'package:daily_scrum/core/usecases/usecase.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/repositories/remote/i_daily_remote_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateDailyUsecase implements UseCaseFuture<DailyEntity, DailyEntity> {
  final IDailyRemoteRepository repository;

  UpdateDailyUsecase({required this.repository});

  @override
  Future<Either<FailureError, DailyEntity>> call({
    required DailyEntity params,
  }) async {
    if (params.id.isEmpty) {
      return Left(InvalidValueError('O id da Daily está vazio!'));
    } else if (params.todoYesterday.isEmpty) {
      return Left(
        InvalidValueError('Preencha o campo do que foi feito ontem!'),
      );
    } else if (params.todoToday.isEmpty) {
      return Left(
        InvalidValueError('Preencha o campo do que tens para fazer hoje!'),
      );
    } else if (params.thereAnyImpediment.isEmpty) {
      return Left(
        InvalidValueError(
          'Preencha o campo se tem algum impedimento para realizar sua atividade hoje!',
        ),
      );
    }
    return repository.updateDaily(params);
  }
}

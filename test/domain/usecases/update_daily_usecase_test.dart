import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/repositories/remote/i_daily_remote_repository.dart';
import 'package:daily_scrum/domain/usecases/update_daily_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UpdateDailyUsecaseTest {}

class DailyRemoteRepositoryMock extends Mock implements IDailyRemoteRepository {
}

void main() {
  final repository = DailyRemoteRepositoryMock();
  final usecase = UpdateDailyUsecase(repository: repository);
  final daily = DailyEntity(
    createdAt: DateTime.now().toString(),
    todoYesterday: 'todoYesterday',
    todoToday: 'todoToday',
    thereAnyImpediment: 'thereAnyImpediment',
    id: '1',
  );

  test('Should returned DailyEntity when the update to occur', () async {
    when(() => repository.updateDaily(daily))
        .thenAnswer((_) async => Right(daily));

    final result = await usecase(params: daily);

    expect(result.isRight(), true);
    final DailyEntity returnedDaily = (result.fold(id, id) as DailyEntity);
    expect(returnedDaily, daily);
  });

  test(
    'Should returned IncalidValueErrro when the id of DailyEntity isEmpty',
    () async {
      final daily = DailyEntity(
        createdAt: DateTime.now().toString(),
        todoYesterday: 'todoYesterday',
        todoToday: 'todoToday',
        thereAnyImpediment: 'thereAnyImpediment',
        id: '',
      );
      final result = await usecase(params: daily);
      expect(result.isLeft(), true);
      final InvalidValueError invalidValueError =
          (result.fold(id, id) as InvalidValueError);
      expect(
        invalidValueError.message,
        'O id da Daily está vazio!',
      );
    },
  );

  test(
    'Should returned IncalidValueErrro when the todoYesterday of DailyEntity isEmpty',
    () async {
      final daily = DailyEntity(
        createdAt: DateTime.now().toString(),
        todoYesterday: '',
        todoToday: 'todoToday',
        thereAnyImpediment: 'thereAnyImpediment',
        id: '1',
      );
      final result = await usecase(params: daily);
      expect(result.isLeft(), true);
      final InvalidValueError invalidValueError =
          (result.fold(id, id) as InvalidValueError);
      expect(
        invalidValueError.message,
        'Preencha o campo do que foi feito ontem!',
      );
    },
  );

  test(
    'Should returned IncalidValueErrro when the todoToday of DailyEntity isEmpty',
    () async {
      final daily = DailyEntity(
        createdAt: DateTime.now().toString(),
        todoYesterday: 'todoYesterday',
        todoToday: '',
        thereAnyImpediment: 'thereAnyImpediment',
        id: '1',
      );
      final result = await usecase(params: daily);
      expect(result.isLeft(), true);
      final InvalidValueError invalidValueError =
          (result.fold(id, id) as InvalidValueError);
      expect(
        invalidValueError.message,
        'Preencha o campo do que tens para fazer hoje!',
      );
    },
  );

  test(
    'Should returned IncalidValueErrro when the thereAnyImpediment of DailyEntity isEmpty',
    () async {
      final daily = DailyEntity(
        createdAt: DateTime.now().toString(),
        todoYesterday: 'todoYesterday',
        todoToday: 'todoToday',
        thereAnyImpediment: '',
        id: '1',
      );
      final result = await usecase(params: daily);
      expect(result.isLeft(), true);
      final InvalidValueError invalidValueError =
          (result.fold(id, id) as InvalidValueError);
      expect(
        invalidValueError.message,
        'Preencha o campo se tem algum impedimento para realizar sua atividade hoje!',
      );
    },
  );
}

import 'package:daily_scrum/data/models/daily_model.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/repositories/remote/i_auth_remote_repository.dart';
import 'package:daily_scrum/domain/repositories/remote/i_daily_remote_repository.dart';
import 'package:daily_scrum/domain/usecases/get_dailys_usecase.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DailyRemoteRepositoryMock extends Mock implements IDailyRemoteRepository {
}

void main() {
  final repository = DailyRemoteRepositoryMock();
  final usecase = GetDailysUsecase(repository: repository);
  test('Should do list dailys', () async {
    when(() => repository.getDailys())
        .thenAnswer((_) async => Right(<DailyEntity>[
              DailyModel(
                  createdAt: "createdAt",
                  todoYesterday: "todoYesterday",
                  todoToday: "todoToday",
                  thereAnyImpediment: "thereAnyImpediment",
                  id: "id")
            ]));

    final result = await usecase();

    expect(result.isRight(), true);
    final List<DailyEntity> dailys = (result.fold(id, id) as List<DailyEntity>);
    expect(dailys.first.todoToday, 'todoToday');
  });
  
  
  
  
  test('Should returned error when the repository fail', () async {
    when(() => repository.getDailys())
        .thenAnswer((_) async => Left(AuthError("Erro repository")));
    final result = await usecase();

    expect(result.isLeft(), true);
    final AuthError authError = (result.fold(id, id) as AuthError);
    expect(authError.message, 'Erro repository');
  });
}

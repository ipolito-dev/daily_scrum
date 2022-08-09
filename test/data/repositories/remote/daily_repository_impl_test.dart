import 'package:daily_scrum/data/datasources/daily_datasource/i_daily_datasource.dart';
import 'package:daily_scrum/data/models/daily_model.dart';
import 'package:daily_scrum/data/repositories/remote/daily_repository_impl.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DailyRepositoryImplTest {
  
}
class DailyDatasourceMock extends Mock implements IDailyDatasource {}

void main() {
  final datasource = DailyDatasourceMock();
  final repository = DailyRepositoryImpl(datasource);

  test('Should returned one List<DailyModel> ', () async {
    when(() => datasource.getDailys()).thenAnswer((_) async => <DailyModel>[]);

    final result = await repository.getDailys();

    expect(result.isRight(), true);
    expect((result.fold(id, id)), isA<List<DailyModel>>());
  });

  test('Should returned one erro if datasourcce fail', () async {
    when(() => datasource.getDailys()).thenThrow(Exception());

    final result = await repository.getDailys();

    expect(result.isLeft(), true);
    expect((result.fold(id, id)), isA<DatasourceError>());
  });

  final dailyModel = DailyModel(
      createdAt: DateTime.now().toString(),
      todoYesterday: 'todoYesterday',
      todoToday: 'todoToday',
      thereAnyImpediment: 'thereAnyImpediment',
      id: '1',);
  test('Should returned one DailyModel when update to occur', () async {
    when(() => datasource.updateDaily(dailyModel))
        .thenAnswer((_) async => dailyModel);

    final result = await repository.updateDaily(dailyModel);

    expect(result.isRight(), true);
    expect((result.fold(id, id)), isA<DailyModel>());
  });

  test('Should returned one erro  in updateDaily when datasourcce fail',
      () async {
    when(() => datasource.updateDaily(dailyModel)).thenThrow(Exception());

    final result = await repository.updateDaily(dailyModel);

    expect(result.isLeft(), true);
    expect((result.fold(id, id)), isA<DatasourceError>());
  },);
}

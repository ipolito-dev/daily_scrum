import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/data/datasources/daily_datasource/i_daily_datasource.dart';
import 'package:daily_scrum/data/models/daily_model.dart';
import 'package:daily_scrum/data/models/logged_user_model.dart';
import 'package:daily_scrum/data/repositories/remote/auth_repository_impl.dart';
import 'package:daily_scrum/data/repositories/remote/daily_repository_impl.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DailyDatasourceMock extends Mock implements IDailyDatasource {}

void main() {
  final datasource = DailyDatasourceMock();
  final repository = DailyRepositoryImpl(datasource);

  test('Should retuned one List<DailyModel> ', () async {
    when(() => datasource.getDailys()).thenAnswer((_) async => <DailyModel>[]);

    final result = await repository.getDailys();

    expect(result.isRight(), true);
    expect((result.fold(id, id)), isA<List<DailyModel>>());
  });

  test('Should retuned one erro if datasourcce fail', () async {
    when(() => datasource.getDailys()).thenThrow(Exception());

    final result = await repository.getDailys();

    expect(result.isLeft(), true);
    expect((result.fold(id, id)), isA<DatasourceError>());
  });
}

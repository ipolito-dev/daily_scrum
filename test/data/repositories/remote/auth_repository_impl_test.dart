import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/data/models/logged_user_model.dart';
import 'package:daily_scrum/data/repositories/remote/auth_repository_impl.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryImplTest {}

class AuthDatasourceMock extends Mock implements IAuthDatasource {}

void main() {
  final datasource = AuthDatasourceMock();
  final repository = AuthRepositoryImpl(datasource);
  final params = CredentialParams(email: 'email', password: '12345');

  test('Should retuned one LoggedUserModel ', () async {
    when(() => datasource.login(params))
        .thenAnswer((_) async => LoggedUserModel(name: 'name', email: 'email'));

    final result = await repository.login(params);

    expect(result.isRight(), true);
    expect((result.fold(id, id)), isA<LoggedUserEntity>());
  });

  test('Should retuned one erro if datasourcce fail', () async {
    when(() => datasource.login(params)).thenThrow(Exception());

    final result = await repository.login(params);

    expect(result.isLeft(), true);
    expect((result.fold(id, id)), isA<DatasourceError>());
  });
}

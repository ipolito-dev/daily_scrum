import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/repositories/remote/i_auth_remote_repository.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginUsecaseTest {
  
}
class AuthRepositoryMock extends Mock implements IAuthRemoteRepository {}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUsecase(repository: repository);
  final params =
      CredentialParams(email: 'ipolito@gmail.com', password: '12345');
  test('Should do login when if e-mail is valid', () async {
    when(() => repository.login(params)).thenAnswer((_) async =>
        Right(LoggedUserEntity(name: 'ipolito', email: params.email)));

    final result = await usecase(params: params);

    expect(result.isRight(), true);
    final LoggedUserEntity loggedUser =
        (result.fold(id, id) as LoggedUserEntity);
    expect(loggedUser.name, 'ipolito');
  });
  test('Should returned error when params is null', () async {
    final result = await usecase();

    expect(result.isLeft(), true);
    final AuthError authError = (result.fold(id, id) as AuthError);
    expect(authError.message, 'Credenciais vazias');
  });
  test('Should returned error when the e-mail is invalid', () async {
    final result = await usecase(
        params: CredentialParams(email: 'ipolito@.com', password: '12345'),);

    expect(result.isLeft(), true);
    final AuthError authError = (result.fold(id, id) as AuthError);
    expect(authError.message, 'O e-mail não é válido');
  });
  test('Should returned error when the e-mail is empty', () async {
    final result =
        await usecase(params: CredentialParams(email: '', password: '12345'));

    expect(result.isLeft(), true);
    final AuthError authError = (result.fold(id, id) as AuthError);
    expect(authError.message, 'Preencha o campo de email');
  });
  test('Should returned error when the password is empty', () async {
    final result = await usecase(
        params: CredentialParams(email: 'ipolito@gmail.com', password: ''),);

    expect(result.isLeft(), true);
    final AuthError authError = (result.fold(id, id) as AuthError);
    expect(authError.message, 'Preencha o campo de senha');
  });
  test('Should returned error when the repository fail', () async {
    when(() => repository.login(params))
        .thenAnswer((_) async => Left(AuthError('Erro repository')));
    final result = await usecase(params: params);

    expect(result.isLeft(), true);
    final AuthError authError = (result.fold(id, id) as AuthError);
    expect(authError.message, 'Erro repository');
  });
}

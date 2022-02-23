import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:daily_scrum/presentation/login/login_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginUsecaseMock extends Mock implements LoginUsecase {}

void main() {
  final usecase = LoginUsecaseMock();
  test('Should retuned LoggedUserEntity when logged whit success', () async {
    final controller = LoginController(usecase);
    when(() => usecase.call(params: any(named: "params"))).thenAnswer(
        (_) async =>
            Right(LoggedUserEntity(name: "teste", email: "teste@teste.com")));

    await controller.login();

    expect(controller.loggedUser, isA<LoggedUserEntity>());
    expect(controller.loggedUser, isNotNull);
  });





















  // test('Should retuned AuthError when login whit not success', () async {
  //   final controller = LoginController(usecase);
  //   when(() => usecase.call(params: any(named: "params")))
  //       .thenAnswer((_) async => Left(AuthError("Erro")));

  //   await controller.login();

  //   expect(controller.loggedUser, isNull);
  // });
}

import 'package:daily_scrum/core/common/utils/validations.dart';
import 'package:daily_scrum/core/usecases/usecase.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/repositories/remote/i_auth_remote_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase
    implements UseCaseFuture<FailureError, LoggedUserEntity, CredentialParams> {
  final IAuthRemoteRepository repository;

  LoginUsecase({required this.repository});

  @override
  Future<Either<FailureError, LoggedUserEntity>> call(
      {CredentialParams? params}) async {
    if (params == null) {
      return Left(AuthError("Credenciais vazias"));
    } else if (params.email.isEmpty) {
      return Left(AuthError("Preencha o campo de email"));
    } else if (!Validations.isEmail(email: params.email)) {
      return Left(AuthError("O e-mail não é válido"));
    } else if (params.password.isEmpty) {
      return Left(AuthError("Preencha o campo de senha"));
    }
    return repository.login(params);
  }
}

class CredentialParams {
  final String email;
  final String password;

  CredentialParams({required this.email, required this.password});
}

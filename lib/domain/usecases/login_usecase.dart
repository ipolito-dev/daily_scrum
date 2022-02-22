import 'package:daily_scrum/core/common/utils/validations.dart';
import 'package:daily_scrum/core/usecases/usecase.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/errors/auth_exception.dart';
import 'package:daily_scrum/domain/repositories/remote/i_auth_remote_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase
    implements
        UseCaseFuture<AuthException, LoggedUserEntity, CredentialParams> {
  final IAuthRemoteRepository repository;

  LoginUsecase({required this.repository});

  @override
  Future<Either<AuthException, LoggedUserEntity>> call(
      {CredentialParams? params}) async {
    if (params == null) {
      return Left(AuthException("Params null"));
    } else if (!Validations.isEmail(email: params.email)) {
      return Left(AuthException("Email invalid"));
    } else if (params.password.isEmpty) {
      return Left(AuthException("Password empty"));
    }
    return repository.login(params);
  }
}

class CredentialParams {
  final String email;
  final String password;

  CredentialParams({required this.email, required this.password});
}

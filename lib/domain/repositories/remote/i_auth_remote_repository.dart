import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/errors/auth_exception.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRemoteRepository {
  Future<Either<AuthException, LoggedUserEntity>> login(
      CredentialParams params);
}

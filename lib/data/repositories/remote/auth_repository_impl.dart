import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/repositories/remote/i_auth_remote_repository.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements IAuthRemoteRepository {
  final IAuthDatasource datasource;
  AuthRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, LoggedUserEntity>> login(
    CredentialParams params,
  ) async {
    try {
      final user = await datasource.login(params);
      return Right(user);
    } on DatasourceError catch (e) {
      return Left(e);
    } on Exception {
      return Left(DatasourceError('DatasourceError error'));
    }
  }
}

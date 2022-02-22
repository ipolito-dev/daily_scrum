import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';

abstract class IAuthDatasource {
  Future<LoggedUserEntity> login(CredentialParams params);
}

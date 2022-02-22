
import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';

class FirebaseAuthDatasourceImpl implements IAuthDatasource{
  @override
  Future<LoggedUserEntity> login(CredentialParams params) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
}
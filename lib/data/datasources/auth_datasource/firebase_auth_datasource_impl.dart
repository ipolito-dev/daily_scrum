import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/data/models/logged_user_model.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';

class FirebaseAuthDatasourceImpl implements IAuthDatasource {
  @override
  Future<LoggedUserModel> login(CredentialParams params) {
    // TODO: implement login
    throw UnimplementedError();
  }
}

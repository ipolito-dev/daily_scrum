import 'package:daily_scrum/data/models/logged_user_model.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';

abstract class IAuthDatasource {
  Future<LoggedUserModel> login(CredentialParams params);
}

import 'package:daily_scrum/core/services/rest_client.dart';
import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/data/models/logged_user_model.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';

class ApiAuthDatasourceImpl implements IAuthDatasource {
  final RestClient restClient;

  ApiAuthDatasourceImpl(this.restClient);

  @override
  Future<LoggedUserModel> login(CredentialParams params) async {
    final body = {
      'email': params.email,
      'password': params.password,
    };
    var response = await restClient.post('/login', data: body);
    if (response.statusCode == 200) {
      return LoggedUserModel.fromMap(response.data[0]);
    } else {
      throw DatasourceError("ApiAuthDatasourceImpl login error");
    }
  }
}

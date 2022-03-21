import 'package:daily_scrum/core/services/http_service.dart';
import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/data/models/logged_user_model.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';

class ApiAuthDatasourceImpl implements IAuthDatasource {
  final HttpService _httpService;

  ApiAuthDatasourceImpl(this._httpService);

  @override
  Future<LoggedUserModel> login(CredentialParams params) async {
    final body = {
      'email': params.email,
    };
    var response = await _httpService.get('/login', queryParameters: body);
    final statusCode = response.statusCode;
    if (statusCode == 200 && response.data.isEmpty) {
      throw DatasourceError("E-mail não encontrado");
    } else if (statusCode == 200) {
      return LoggedUserModel.fromMap(response.data[0]);
    } else {
      throw DatasourceError("ApiAuthDatasourceImpl login error");
    }
  }
}

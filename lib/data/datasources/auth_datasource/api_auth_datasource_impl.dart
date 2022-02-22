import 'package:daily_scrum/core/services/rest_client.dart';
import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/data/models/logged_user_model.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:dio/dio.dart';

class ApiAuthDatasourceImpl implements IAuthDatasource {
  final Dio _dio = Dio(restClient.options);
  @override
  Future<LoggedUserEntity> login(CredentialParams params) async {
    // try {
    final data = {
      'email': params.email,
      'password': params.password,
    };
    var response = await _dio.post('/login', data: data);
    print(response);
    return LoggedUserModel.fromMap(response.data[0]);
    // } on DioError catch (e) {
    //   ClientStringCodeErrors treatedErrors =
    //       ClientStringCodeErrors.automaticMessages(
    //           messageToBeReplicated: "usuário não encontrado", dioError: e);
    //   throw StatusException().build(e.response?.statusCode ?? 0, treatedErrors);
    // }
  }
}

import 'dart:convert';

import 'package:daily_scrum/core/common/utils/response_mocks.dart';
import 'package:daily_scrum/core/services/rest_client.dart';
import 'package:daily_scrum/data/datasources/auth_datasource/api_auth_datasource_impl.dart';
import 'package:daily_scrum/data/models/logged_user_model.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RestClientMock extends Mock implements RestClient {}

void main() {
  var restClient = RestClientMock();
  final datasource = ApiAuthDatasourceImpl(restClient);
  final params = CredentialParams(email: "a@a.com", password: "12345");

  test('Should returned one LoggedUserModel when statusCode == 200...',
      () async {
    when(() => restClient.get(any(),
        queryParameters: any(named: "queryParameters"))).thenAnswer(
      (_) async => Response(
        data: jsonDecode(apiLoginResult),
        statusCode: 200,
        requestOptions: RequestOptions(path: ""),
      ),
    );
    final result = datasource.login(params);
    expect(result, completes);
    expect(await result, isA<LoggedUserModel>());
  });
  test(
      'Should returned one DatasourceError when statusCode == 200 and list empty...',
      () async {
    when(() => restClient.get(any(),
        queryParameters: any(named: "queryParameters"))).thenAnswer(
      (_) async => Response(
        data: jsonDecode("""[]"""),
        statusCode: 200,
        requestOptions: RequestOptions(path: ""),
      ),
    );
    final result = datasource.login(params);
    expect(result, throwsA(isA<DatasourceError>()));
  });

  test('Should returned one DatasourceError when statusCode != 200...',
      () async {
    when(() => restClient.get(any(),
        queryParameters: any(named: "queryParameters"))).thenAnswer(
      (_) async => Response(
        data: null,
        statusCode: 401,
        requestOptions: RequestOptions(path: ""),
      ),
    );
    final result = datasource.login(params);
    expect(result, throwsA(isA<DatasourceError>()));
  });

  test('Should returned one Error when exist error internal of Dio...',
      () async {
    when(() => restClient.get(any(),
        queryParameters: any(named: "queryParameters"))).thenThrow(Exception());
    final result = datasource.login(params);
    expect(result, throwsA(isA<Exception>()));
  });
}

import 'dart:convert';

import 'package:daily_scrum/core/common/utils/response_mocks.dart';
import 'package:daily_scrum/core/services/rest_client.dart';
import 'package:daily_scrum/data/datasources/daily_datasource/api_daily_datasource_impl.dart';
import 'package:daily_scrum/data/models/daily_model.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ApiDailyDatasourceImplTest {}

class RestClientMock extends Mock implements RestClient {}

void main() {
  var restClient = RestClientMock();
  final datasource = ApiDailyDatasourceImpl(restClient);

  test(
    'Should returned one List<DailyModel> when statusCode == 200...',
    () async {
      when(() => restClient.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer(
        (_) async => Response(
          data: jsonDecode(apiDailysResult),
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      final result = datasource.getDailys();
      expect(result, completes);
      expect(await result, isA<List<DailyModel>>());
    },
  );

  test(
    'Should returned one DatasourceError when statusCode different 200...',
    () async {
      when(() => restClient.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer(
        (_) async => Response(
          data: null,
          statusCode: 401,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      final result = datasource.getDailys();
      expect(result, throwsA(isA<DatasourceError>()));
    },
  );

  test(
    'Should returned one Error when exist error internal of Dio...',
    () async {
      when(() => restClient.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenThrow(Exception());
      final result = datasource.getDailys();
      expect(result, throwsA(isA<Exception>()));
    },
  );

  //Update Daily
  final dailyModel = DailyModel(
      createdAt: DateTime.now().toString(),
      todoYesterday: 'todoYesterday',
      todoToday: 'todoToday',
      thereAnyImpediment: 'thereAnyImpediment',
      id: '1',);
  test('Should returned one DailyModel when statusCode == 200', () async {
    when(() => restClient.put(any(), data: any(named: 'data'))).thenAnswer(
      (_) async => Response(
        data: jsonDecode(dailyModel.toJson()),
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );
    final result = datasource.updateDaily(dailyModel);
    expect(result, completes);
    expect(await result, isA<DailyModel>());
  });

  test(
    'Should returned one DatasourceError in updateDaily when statusCode different 200',
    () async {
      when(() => restClient.put(any(), data: any(named: 'data'))).thenAnswer(
        (_) async => Response(
          data: null,
          statusCode: 401,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      final result = datasource.updateDaily(dailyModel);
      expect(result, throwsA(isA<DatasourceError>()));
    },
  );

  test(
    'Should returned one Error in updateDaily when exist error internal of Dio...',
    () async {
      when(() => restClient.put(any(), data: any(named: 'data')))
          .thenThrow(Exception());
      final result = datasource.updateDaily(dailyModel);
      expect(result, throwsA(isA<Exception>()));
    },
  );
}

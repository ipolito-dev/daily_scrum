import 'package:daily_scrum/core/services/http_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class RestClient extends DioForNative implements HttpService {
  final baseUrl = 'https://6213d51c89fad53b1f02f8a0.mockapi.io/api/v1';
  final contentType = 'application/json; charset=utf-8';
  final connectionTimeOut = 10000;
  final reciveTimeOut = 1000;
  RestClient() {
    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: contentType,
      connectTimeout: connectionTimeOut,
      receiveTimeout: reciveTimeOut,
      headers: {
        //TODO: SET IF HAS TOKEN
        // 'Authorization': 'Bearer ${token}',
      },
    );
  }
}

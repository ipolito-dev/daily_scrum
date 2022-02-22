import 'package:dio/dio.dart';

class RestClient {
  static const baseUrl = "https://6213d51c89fad53b1f02f8a0.mockapi.io/api/v1";
  static const contentType = "application/json; charset=utf-8";
  static const connectionTimeOut = 10000;
  static const reciveTimeOut = 1000;

  final BaseOptions options = BaseOptions(
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

RestClient restClient = RestClient();

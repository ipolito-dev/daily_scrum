import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
  Future<Response<T>> put<T>(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    // CancelToken? cancelToken,
    // void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  });
}

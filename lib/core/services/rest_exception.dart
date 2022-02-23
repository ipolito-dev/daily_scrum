import 'package:dio/dio.dart';

class RestException implements Exception {
  final String? message;
  final int? statusCode;
  final Response? response;

  RestException({
    this.message,
    this.statusCode,
    this.response,
  });

  @override
  String toString() => ' $message';
}

import 'package:daily_scrum/core/errors/client_string_code_errors.dart';
import 'package:daily_scrum/core/services/rest_exception.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';

/// Describe.
class StatusException extends FailureError {
  StatusException(String message) : super(message);

  RestException build(int statusCode, ClientStringCodeErrors erros) {
    switch (StatusCode.toCode(statusCode)) {
      case StatusCode.c204:
        return throw RestException(
          message: erros.code_204 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      case StatusCode.c304:
        return throw RestException(
          message: erros.code_304 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      case StatusCode.c400:
        return throw RestException(
          message: erros.code_400 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      case StatusCode.c401:
        return throw RestException(
          message: erros.code_401 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      case StatusCode.c403:
        return throw RestException(
          message: erros.code_403 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      case StatusCode.c404:
        return throw RestException(
          message: erros.code_404 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      case StatusCode.c405:
        return throw RestException(
          message: erros.code_405 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      case StatusCode.c406:
        return throw RestException(
          message: erros.code_406 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      case StatusCode.c500:
        return throw RestException(
          message: erros.code_500 ?? erros.messageDefault,
          statusCode: statusCode,
        );
      default:
        return throw RestException(message: erros.messageDefault);
    }
  }
}

enum StatusCode {
  c200('200'),
  c204('204'),
  c304('304'),
  c400('400'),
  c401('401'),
  c403('403'),
  c404('404'),
  c405('405'),
  c406('406'),
  c500('500');

  final String value;
  const StatusCode(this.value);

  int get cod => int.parse(value);

  factory StatusCode.toCode(int code) {
    for (var value in StatusCode.values) {
      if (value.cod == code) return value;
    }
    throw 'O Status Code $code não está mapeado no enum de StatusCode';
  }
}

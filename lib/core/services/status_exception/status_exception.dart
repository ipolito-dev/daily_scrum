import 'package:daily_scrum/core/errors/client_string_code_errors.dart';
import 'package:daily_scrum/core/services/rest_exception.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';

/// Describe.
class StatusException extends FailureError {
  StatusException(String message) : super(message);

  RestException build(int statusCode, ClientStringCodeErrors erros) {
    switch (statusCode) {
      case 204:
        return throw RestException(
            message: erros.code_204 ?? erros.messageDefault,
            statusCode: statusCode);
      case 304:
        return throw RestException(
            message: erros.code_304 ?? erros.messageDefault,
            statusCode: statusCode);
      case 400:
        return throw RestException(
            message: erros.code_400 ?? erros.messageDefault,
            statusCode: statusCode);
      case 401:
        return throw RestException(
            message: erros.code_401 ?? erros.messageDefault,
            statusCode: statusCode);
      case 403:
        return throw RestException(
            message: erros.code_403 ?? erros.messageDefault,
            statusCode: statusCode);
      case 404:
        return throw RestException(
            message: erros.code_404 ?? erros.messageDefault,
            statusCode: statusCode);
      case 405:
        return throw RestException(
            message: erros.code_405 ?? erros.messageDefault,
            statusCode: statusCode);
      case 406:
        return throw RestException(
            message: erros.code_406 ?? erros.messageDefault,
            statusCode: statusCode);
      case 500:
        return throw RestException(
            message: erros.code_500 ?? erros.messageDefault,
            statusCode: statusCode);
      default:
        return throw RestException(message: erros.messageDefault);
    }
  }
}

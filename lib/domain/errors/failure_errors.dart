class FailureErrors {}

class FailureError implements Exception {
  final String message;

  FailureError(this.message);
}

class AuthError extends FailureError {
  AuthError(String message) : super(message);
}

class DatasourceError extends FailureError {
  DatasourceError(String message) : super(message);
}

class InvalidValueError extends FailureError {
  InvalidValueError(String message) : super(message);
}

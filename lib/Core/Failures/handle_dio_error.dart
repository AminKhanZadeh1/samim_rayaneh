import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class TimeoutFailure extends Failure {
  TimeoutFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class CancelFailure extends Failure {
  CancelFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

Failure handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return TimeoutFailure('Connection timed out');
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutFailure('Connection timed out');
    case DioExceptionType.badResponse:
      return ServerFailure(
          'Server responded with ${e.response?.statusCode}: ${e.response?.statusMessage}');
    case DioExceptionType.cancel:
      return CancelFailure('Request was cancelled');
    case DioExceptionType.connectionError:
      return NetworkFailure('No internet connection');
    default:
      return UnknownFailure('Something went wrong');
  }
}

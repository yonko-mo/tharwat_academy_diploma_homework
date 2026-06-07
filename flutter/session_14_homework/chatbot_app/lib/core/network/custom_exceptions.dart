import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  ApiException({required this.message});
  factory ApiException.fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ApiException(message: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ApiException(message: 'Receive timeout');
      case DioExceptionType.badResponse:
        return ApiException(message: 'Bad response');
      case DioExceptionType.cancel:
        return ApiException(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return ApiException(message: 'Connection error');
      case DioExceptionType.unknown:
        return ApiException(message: 'Unknown error');
      default:
        return ApiException(message: 'Unknown error');
    }
  }
}

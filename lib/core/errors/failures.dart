import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('Unexpected error,please try again later!');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Connection with Api was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Unexpected error,please try again later!');

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error,please try again later!');

      case DioExceptionType.transformTimeout:
        return ServerFailure('Unexpected error,please try again later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found,please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error,please try again later!');
    } else {
      return ServerFailure('Oops there was an error,please try again later!');
    }
  }
}

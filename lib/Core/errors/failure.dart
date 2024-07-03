import 'package:dio/dio.dart';

abstract class Failure {
  final errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with apiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with apiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receiver timeout with apiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Validate Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('cancel Certificate');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        } else {
          return ServerFailure('Unexpected Error, pleas try agin');
        }
      default:
        return ServerFailure('Ops There was an error , pleas try agin');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try later!');
    } else {
      return ServerFailure('Ops There was an error , pleas try agin');
    }
  }
}

import 'package:dio/dio.dart';

import '../model/response_entity.dart';

class HttpException implements Exception {
  static const unknownException = "未知错误";
  final String? message;
  final int? code;
  String? stackInfo;

  HttpException([this.code, this.message]);

  factory HttpException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException(-1, "请求取消");
      case DioErrorType.connectTimeout:
        return BadRequestException(-1, "连接超时");
      case DioErrorType.sendTimeout:
        return BadRequestException(-1, "请求超时");
      case DioErrorType.receiveTimeout:
        return BadRequestException(-1, "响应超时");
      case DioErrorType.response:
        try {
          /// http 错误码带业务错误信息
          ResponseEntity responseEntity =
              ResponseEntity.fromJson(error.response?.data);
          // if (responseEntity.code != null) {
          //   return HttpException(responseEntity.code, responseEntity.message);
          // }

          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 400:
              return BadRequestException(errCode, "请求语法错误");
            case 401:
              return UnauthorisedException(errCode!, "没有权限");
            case 403:
              return UnauthorisedException(errCode!, "服务器拒绝执行");
            case 404:
              return UnauthorisedException(errCode!, "无法连接服务器");
            case 405:
              return UnauthorisedException(errCode!, "请求方法被禁止");
            case 500:
              return UnauthorisedException(errCode!, "服务器内部错误");
            case 502:
              return UnauthorisedException(errCode!, "无效的请求");
            case 503:
              return UnauthorisedException(errCode!, "服务器异常");
            case 505:
              return UnauthorisedException(errCode!, "不支持HTTP协议请求");
            default:
              return HttpException(
                  errCode, error.response?.statusMessage ?? '未知错误');
          }
        } on Exception catch (e) {
          return HttpException(-1, unknownException);
        }
      default:
        return BadRequestException(-1, '服务器异常,稍后重试');
    }
  }

  factory HttpException.from(dynamic exception) {
    if (exception is DioError) {
      return HttpException.fromDioError(exception);
    }
    if (exception is HttpException) {
      return exception;
    } else {
      HttpException exception = HttpException(-1, unknownException);
      exception.stackInfo = exception?.toString();
      return exception;
    }
  }
}

/// 请求错误
class BadRequestException extends HttpException {
  BadRequestException([int? code, String? message]) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends HttpException {
  UnauthorisedException([int code = -1, String message = ''])
      : super(code, message);
}

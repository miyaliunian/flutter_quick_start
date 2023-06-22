import 'package:base_module/request/exception/http_exception.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

bool handleException(HttpException exception,
    {bool Function(HttpException)? onError}) {
  if (onError?.call(exception) == true) {
    return true;
  }

  if (exception.code == 401) {
    ///todo to login
    return true;
  }
  EasyLoading.showError(exception.message ?? HttpException.unknownException);

  return false;
}

library http_client;

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:base_module/request/exception/http_exception.dart';
import 'package:base_module/request/config/http_config.dart';
import 'package:base_module/request/model/response_entity.dart';

import 'Interceptor/token_Inter.dart';
import 'model/raw_data.dart';

HttpClient requestClient = HttpClient();

class HttpClient {
  late Dio _dio;

  HttpClient() {
    _dio = Dio(BaseOptions(
        baseUrl: HttpConfig.baseUrl,
        connectTimeout: HttpConfig.connectTimeout,
        receiveTimeout: HttpConfig.connectTimeout));
    _dio.interceptors.add(TokenInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }

  Future<T?> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    Function(ResponseEntity<T>)? onResponse,
  }) {
    return request(
      url,
      queryParameters: queryParameters,
      headers: headers,
      onResponse: onResponse,
    );
  }

  Future<T?> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    Function(ResponseEntity<T>)? onResponse,
  }) {
    return request(
      url,
      method: "POST",
      queryParameters: queryParameters,
      data: data,
      headers: headers,
      onResponse: onResponse,
    );
  }

  Future<T?> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    Function(ResponseEntity<T>)? onResponse,
  }) {
    return request(
      url,
      method: "DELETE",
      queryParameters: queryParameters,
      data: data,
      headers: headers,
      onResponse: onResponse,
    );
  }

  Future<T?> put<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    Function(ResponseEntity<T>)? onResponse,
  }) {
    return request(
      url,
      method: "PUT",
      queryParameters: queryParameters,
      data: data,
      headers: headers,
      onResponse: onResponse,
    );
  }

  Future<T?> request<T>(
    String url, {
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    Function(ResponseEntity<T>)? onResponse,
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;

      data = _convertRequestData(data);

      Response response = await _dio.request(url,
          queryParameters: queryParameters, data: data, options: options);
      return _handleResponse<T>(response, onResponse);
    } catch (e) {
      var exception = HttpException.from(e);
      if (kReleaseMode) {
        Sentry.captureException(e.toString());
      } else if (kDebugMode) {
        print(exception.message);
      }
      return Future.error('');
    }
  }

  // 响应内容处理
  Future<T?> _handleResponse<T>(
      Response response, Function(ResponseEntity<T>)? onResponse) {
    if (response.statusCode == 200) {
      // 普通数据转换
      if (T.toString() == (RawData).toString()) {
        RawData raw = RawData();
        raw.value = response.data;
        return Future.value(raw as T);
      } else {
        ResponseEntity<T> responseEntity =
            ResponseEntity<T>.fromJson(response.data);
        // onResponse?.call(responseEntity);
        return _handleBusinessResponse<T>(responseEntity);
      }
    } else {
      var exception =
          HttpException(response.statusCode, HttpException.unknownException);
      throw exception;
    }
  }

  // 业务内容处理
  Future<T?> _handleBusinessResponse<T>(ResponseEntity<T> response) {
    if (response.status?.toUpperCase() == HttpConfig.successCode) {
      return Future.value(response.data);
    } else {
      Map<String, dynamic> error = {
        'message': response.data ?? response.errors
      };
      return Future.error(error);
    }
  }

  // 请求数据转换
  _convertRequestData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }
}

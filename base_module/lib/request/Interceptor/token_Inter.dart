import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'token_bridge.dart';

// token拦截器
class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    TokenBridge tokenBridge = TokenBridge();
    String? token = tokenBridge.getToken();
    options.headers["token"] = token ?? "";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(dio.Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}

import 'package:flutter/services.dart';

import 'token_bridge_config.dart';

class TokenBridge {
  static const _channelName = CHANNELNAME;

  final MethodChannel _channel = const MethodChannel(_channelName);
  String? _token = '';
  Function(String?)? _onTokenUpdated;

  TokenBridge() {
    _setupToken();
  }

  void _setupToken() async {
    try {
      final token = await _channel.invokeMethod<String>('getToken');
      _setToken(token!);
    } catch (e) {
      print('Failed to get token: $e');
    }
  }

  void _setToken(String token) {
    if (_token != token) {
      _token = token;
      _notifyTokenUpdated();
    }
  }

  void _notifyTokenUpdated() {
    if (_onTokenUpdated != null) {
      _onTokenUpdated!(_token);
    }
  }

  String? getToken() {
    return _token;
  }

  void setOnTokenUpdated(void Function(String?) callback) {
    _onTokenUpdated = callback;
  }
}

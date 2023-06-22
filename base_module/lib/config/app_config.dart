import 'package:flutter/material.dart';
import 'package:base_module/constant/constants.dart';
import 'package:base_module/request/config/http_config.dart';

class AppConfig extends InheritedWidget {
  final String baseUrl;
  static String SENTRY_KEY = Constants.SENTRY_DSN;
  final ThemeData? theme;
  final ThemeData? darTheme;

  AppConfig({
    super.key,
    required this.baseUrl,
    required Widget child,
    this.theme,
    this.darTheme,
  }) : super(child: child) {
    HttpConfig.setBaseUrl(baseUrl);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }
}

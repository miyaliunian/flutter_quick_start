library start_app;

import 'dart:async';

import 'package:base_module/config/app_config.dart';
import 'package:base_module/appLogger/app_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class StartApp {
  final String logPrefix;
  final String baseUrl;
  final ThemeData theme;
  String? sentryDsn;
  final ThemeData darkTheme;
  final Widget child;

  StartApp({
    Key? key,
    this.logPrefix = '',
    this.sentryDsn = '',
    required this.baseUrl,
    required this.theme,
    required this.darkTheme,
    required this.child,
  });

  Future<void> run() async {
    runZonedGuarded<Future<void>>(() async {
      await initializeApp();
    }, (error, stackTrace) async {
      if (kReleaseMode) {
        await Sentry.captureException(
          error,
          stackTrace: stackTrace,
        );
      }
    }, zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, "$logPrefix: $line");
      },
    ));
  }

  Future<void> initializeApp() async {
    await SentryFlutter.init((option) {
      option.dsn = sentryDsn;
    }, appRunner: runAppAndSetup);
  }

  void runAppAndSetup() {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    };
    AppLogger.init();
    runApp(AppConfig(
      baseUrl: baseUrl,
      theme: theme,
      child: child,
    ));
  }
}

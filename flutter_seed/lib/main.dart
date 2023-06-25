import 'package:base_module/config/app.dart';
import 'package:flutter_seed/constant/constants.dart';
import 'package:flutter_seed/page/getx/helper/init_dependencies.dart';
import 'package:flutter_seed/routes/app_pages.dart';
import 'package:base_module/startApp/start_app.dart';
import 'package:flutter_seed/theme/app_theme.dart';

void main() {
  StartApp(
    logPrefix: "mobje-dev",
    baseUrl: Constants.API_BASE_URL,
    sentryDsn: Constants.SENTRY_DSN,
    theme: AppTheme.buildThemeData(),
    darkTheme: AppTheme.buildDarkTheme(),
    child: App(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      initialBinding: InitDepend(),
    ),
  ).run();
}

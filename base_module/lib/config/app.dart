import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:base_module/utils/app_logger.dart';
import 'app_config.dart';

class App extends StatelessWidget {
  final String initialRoute;
  final List<GetPage> getPages;
  final GetPage unknownRoute;
  final Bindings initialBinding;

  const App({
    super.key,
    required this.initialRoute,
    required this.getPages,
    required this.unknownRoute,
    required this.initialBinding,
  });

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    AppLogger.i('baseUrl: ${config.baseUrl}');
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: initialRoute,
          getPages: getPages,
          unknownRoute: unknownRoute,
          initialBinding: initialBinding,
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: config.theme ?? _buildDefaultTheme(),
          darkTheme: config.darTheme ?? _buildDefaultTheme(),
          themeMode: ThemeMode.system,
        );
      },
    );
  }

  ThemeData _buildDefaultTheme() {
    return ThemeData();
  }

  ThemeData _buildDefaultDarkTheme() {
    return ThemeData.dark();
  }
}

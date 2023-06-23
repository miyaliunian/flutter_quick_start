import 'package:flutter_seed/page/getx/counter_page.dart';
import 'package:flutter_seed/page/notfound/index.dart';
import 'package:get/get_navigation/get_navigation.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = AppRoutes.countPage;
  static final unknownRoute =
      GetPage(name: AppRoutes.notFound, page: () => const NotFoundPage());

// 业务路由
  static final routes = [
    GetPage(
      name: AppRoutes.countPage,
      page: () => const CounterPage(),
    ),
  ];
}

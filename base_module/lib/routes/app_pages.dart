import 'package:get/get_navigation/get_navigation.dart';
import 'package:base_module/app/modules/station/bindings/station_binding.dart';
import '../page/getx/counter_page.dart';
import '../page/notfound/index.dart';
import '../app/modules/station/views/station_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = AppRoutes.countPage;

// 404
  static final unknownRoute =
      GetPage(name: AppRoutes.notFound, page: () => const NotFoundPage());

// 业务路由
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      binding: StationBinding(),
      page: () => const StationPage(title: '网点详情'),
    ),
    GetPage(
      name: AppRoutes.countPage,
      page: () => const CounterPage(),
    ),
  ];
}

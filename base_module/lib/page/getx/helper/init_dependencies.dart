import 'package:get/get.dart';
import 'package:base_module/utils/app_logger.dart';
import '../controllers/list_controller.dart';
import '../controllers/tap_controller.dart';

class InitDepend implements Bindings {
  @override
  void dependencies() {
    AppLogger.d('初始化依赖--- 全局Controller');
    Get.lazyPut<TapController>(() => TapController());
    Get.put<ListController>(ListController());
  }
}

import 'package:get/get.dart';

import '../controllers/list_controller.dart';
import '../controllers/tap_controller.dart';

// Controllers initials
Future<void> init() async {
  // Get.put(TapController());
  Get.lazyPut(() => TapController());
  Get.put(ListController());
}

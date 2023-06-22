import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:base_module/app/modules/station/model/station_entity.dart';
import 'package:base_module/request/http_client.dart';
import 'package:base_module/request/utils/block_loading.dart';

// import '../../../../utils/app_logger.dart';

class StationController extends GetxController {
  final Rx<StationEntity?>? entity = Rx<StationEntity?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    blockLoading(() async {
      // print("方法准备调用");
      // await Future.delayed(Duration(seconds: 10), () {
      //   print('---可以关闭动画');
      //   // dismiss();
      // });

      // await Future.delayed(Duration(seconds: 5));
      // print('---准备关闭了');
      await requestClient
          .get<StationEntity>(
        '/native',
      )
          .then((response) {
        entity?.value = response!;
        print(response?.location);
      }).catchError((err) {
        print('catchError=$err');
      });
    });

    // await Future.delayed(Duration(seconds: 3));
  }

  @override
  void onClose() {
    super.onClose();
  }
}

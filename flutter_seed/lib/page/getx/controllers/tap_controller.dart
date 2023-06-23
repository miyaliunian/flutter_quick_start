import 'package:get/get.dart';

class TapController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("初始化");
  }

  int _x = 0;

  int get x => _x;

  final RxInt _y = 0.obs;

  int _z = 0;

  int get z {
    print(_z);
    return _z;
  }

  void increaseX() {
    _x++;
    // 这个一定要写 不然就算用了GetBuilder嵌套了 组件也不会更新
    update();
  }

  void decreaseX() {
    _x--;
    update();
  }

  void totalXY() {
    _z = _x + _y.value;
    // print(_z);
    update();
  }

  RxInt get Y => _y;

  void increaseY() {
    _y.value++;
  }

  void decreaseY() {
    _y.value--;
  }

  void increaseZ() {
    _z++;
    update();
  }
}

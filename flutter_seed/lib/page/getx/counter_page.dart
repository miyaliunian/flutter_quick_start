import 'package:flutter/material.dart';
import 'package:flutter_seed/page/getx/controllers/tap_controller.dart';
import 'package:flutter_seed/page/getx/first_page.dart';
import 'package:flutter_seed/page/getx/second_page.dart';
import 'package:flutter_seed/page/getx/third_page.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 依赖注入 已经抽取到一个固定的文件中  init_controllers
    TapController controller = Get.find<TapController>();
    return Scaffold(
      appBar: AppBar(title: const Text('GetX')),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 泛型一定要传
            GetBuilder<TapController>(builder: (_) {
              return Container(
                margin: const EdgeInsets.all(10),
                width: double.maxFinite,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff89dad0),
                ),
                child: Center(
                  child: Text(
                    controller.x.toString(), // 可以简单点 直接从注入的地方 取值
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            }),
            GestureDetector(
              onTap: () {
                controller.increaseX();
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.maxFinite,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff89dad0),
                ),
                child: const Center(
                  child: Text(
                    "调用controller.increaseX()",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("Go TO NextPage");
                Get.to(() => const FirstPage());
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.maxFinite,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff89dad0),
                ),
                child: const Center(
                  child: Text(
                    'Go To NextPage',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => SecondPage());
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.maxFinite,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff89dad0),
                ),
                child: const Center(
                  child: Text(
                    'Go to SecondPage',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => ThirdPage());
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.maxFinite,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff89dad0),
                ),
                child: const Center(
                  child: Text(
                    'Go to ThirdPage',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

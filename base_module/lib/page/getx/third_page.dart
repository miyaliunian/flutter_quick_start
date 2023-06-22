import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_module/page/getx/controllers/list_controller.dart';
import 'package:base_module/page/getx/controllers/tap_controller.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    ListController listController = Get.find<ListController>();
    return Scaffold(
        appBar: AppBar(title: Text('thrid page')),
        body: Container(
          width: double.maxFinite,
          height: double.infinity,
          child: Column(
            children: [
              Obx(() => Column(
                    children: [
                      Text(
                          "list obs values = ${listController.list.value.toList()}"),
                      Text("value=${Get.find<TapController>().x.toString()}"),
                      Text(
                          "value y = ${Get.find<TapController>().Y.value.toString()}"),
                    ],
                  )),
              GetBuilder<TapController>(builder: (controller) {
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
                      "Z的值${controller.z.toString()}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              }),
              GestureDetector(
                onTap: () {
                  Get.find<TapController>().increaseY();
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text('increase Y',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<TapController>().totalXY();
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text('total',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.find<TapController>().totalXY();
                  Get.find<ListController>()
                      .setValues(Get.find<TapController>().z);
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text('setValues',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

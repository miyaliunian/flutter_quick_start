import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_module/page/getx/controllers/tap_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController tapController = Get.find<TapController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<TapController>(builder: (_) {
              return Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff89dad0),
                ),
                child: Center(
                  child: Text(
                    "geted values${tapController.x.toString()}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    tapController.increaseX();
                  },
                  child: Icon(Icons.add),
                ),
                GestureDetector(
                  onTap: () {
                    tapController.decreaseX();
                  },
                  child: Icon(Icons.delete),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

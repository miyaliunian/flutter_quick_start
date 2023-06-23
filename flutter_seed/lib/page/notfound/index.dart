import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_module/routes/app_pages.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("路由没有找到")),
      body: ListTile(
        title: const Text("返回首页"),
        subtitle: const Text("Get.offNamed(AppRoutes.home)"),
        onTap: () => Get.offAllNamed(AppRoutes.home),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('second page')),
      body: SizedBox(
        width: double.maxFinite,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // AppLogger.i('模拟异常');
                throw Exception('按钮触发抛出异常${DateTime.now().toString()}');
              },
              child: const Text('ElevatedButton 实现主动抛出异常'),
            )
          ],
        ),
      ),
    );
  }
}

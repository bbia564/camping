import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GRPage extends GetView<PageLogic> {
  const GRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.volkman.value
              ? const CircularProgressIndicator(color: Colors.green,)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.khuflma();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}

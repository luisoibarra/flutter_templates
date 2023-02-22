import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'initial_controller.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitialController>(
        builder: (controller) => const Scaffold());
  }
}

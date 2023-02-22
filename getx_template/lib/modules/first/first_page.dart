import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'first_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FirstController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Getx Counter App"),
              ),
              body: Center(
                child: Column(children: [
                  Text("Counter: ${controller.counter}"),
                  FloatingActionButton.extended(
                      onPressed: () => controller.onButtonClicked(),
                      label: const Text("Add"))
                ]),
              ),
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleadd/controller/addcontroller.dart';

class ButtonClass extends StatelessWidget {
  ButtonClass({super.key});
  final AddController controller = Get.put(AddController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Select Add")),
        body: SafeArea(
            child: Center(
          child: Container(
            child: ElevatedButton(
                onPressed: () {
                  String id = "63771caa0c38a726403ad498";
                  controller.getAdd(id: id);
                },
                child: const Text("Btn 1")),
          ),
        )));
  }
}

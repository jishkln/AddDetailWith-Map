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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    String id = "6377173a58811990bb0a0ede";
                    controller.getAdd(id: id);
                  },
                  child: const Text("Btn 1")),
              ElevatedButton(
                  onPressed: () {
                    String id = "6375e7fdddf0c3876c18d921";
                    controller.getAdd(id: id);
                  },
                  child: const Text("Btn 2")),
              ElevatedButton(
                  onPressed: () {
                    String id = "6375acd563625fc3d7cb26d3";
                    controller.getAdd(id: id);
                  },
                  child: const Text("Btn 3")),
              ElevatedButton(
                  onPressed: () {
                    String id = "63771caa0c38a726403ad498";
                    controller.getAdd(id: id);
                  },
                  child: const Text("Btn 4")),
              ElevatedButton(
                  onPressed: () {
                    String id = "6377177558811990bb0a0f87";
                    controller.getAdd(id: id);
                  },
                  child: const Text("Btn 5")),
            ],
          ),
        )));
  }
}

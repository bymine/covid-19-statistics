import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static TotalController get to => Get.find();

  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: "확진자 추이",
    ),
    const Tab(
      text: "사망자 추이",
    ),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

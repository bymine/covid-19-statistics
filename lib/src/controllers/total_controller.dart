import 'package:covid19_statistic_app/src/models/covid19_total.dart';
import 'package:covid19_statistic_app/src/repository/covid_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static TotalController get to => Get.find();

  Rx<DateTime> stateDate = DateTime.now().obs;

  RxList<Covid19TotalInfo> weeksData = RxList([]);
  RxList<int> weeksDecideCnt = RxList([]);
  RxList<int> weeksDeathCnt = RxList([]);

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
    loadWeekTotalData(
      DateTime.now().subtract(const Duration(days: 8)),
      DateTime.now(),
    );
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  // weeksData 불러오기 함수
  loadWeekTotalData(DateTime start, DateTime end) async {
    weeksData(List<Covid19TotalInfo>.from(
        await Covid19Repository.to.loadWeekTotalData(start, end)));
    if (weeksData.isNotEmpty) {
      getTodayCount();
      stateDate.value = DateTime.parse(weeksData.first.stateDate);
    }
  }

  // weeksDecideCnt, weeksDeathCnt 계산 함수
  void getTodayCount() {
    weeksDeathCnt.clear();
    weeksDecideCnt.clear();

    for (int i = 0; i < weeksData.length - 1; i++) {
      weeksDeathCnt.add(weeksData[i].deathCnt - weeksData[i + 1].deathCnt);
      weeksDecideCnt.add(weeksData[i].decideCnt - weeksData[i + 1].decideCnt);
    }
  }

  void changeDate(DateTime selectedDate) {
    stateDate(selectedDate);
    loadWeekTotalData(
        stateDate.value.subtract(const Duration(days: 8)), stateDate.value);
  }
}

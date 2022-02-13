import 'package:covid19_statistic_app/src/models/covid19_total.dart';
import 'package:covid19_statistic_app/src/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xml/xml.dart';

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

class Covid19Repository extends GetConnect {
  static Covid19Repository get to => Get.find();

  String serviceKey =
      "eUvvgcJ+UEy+WvWuGEgGowLwXXO65uWskfEKxX/uHVcuqj1mK12AjRUsVEyRhTTPhlDMbvmtNGYVYVGEtcKNIQ==";
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "http://openapi.data.go.kr";
  }

  loadWeekTotalData(DateTime start, DateTime end) async {
    var query = <String, String>{};
    query.putIfAbsent("serviceKey", () => serviceKey);
    query.putIfAbsent("startCreateDt", () => DataUtils.formatStateDate(start));
    query.putIfAbsent("endCreateDt", () => DataUtils.formatStateDate(end));

    String url = "/openapi/service/rest/Covid19/getCovid19InfStateJson";
    final response = await get(url, query: query);
    final document = XmlDocument.parse(response.body);
    final results = document.findAllElements("item");
    if (results.isNotEmpty) {
      var loadList = results
          .map<Covid19TotalInfo>((element) => Covid19TotalInfo.fromXml(element))
          .toList();
      return loadList;
    } else {
      return [];
    }
  }

  loadCitysData(DateTime date) async {
    var query = <String, String>{};
    query.putIfAbsent("serviceKey", () => serviceKey);
    query.putIfAbsent("startCreateDt", () => DataUtils.formatStateDate(date));
    query.putIfAbsent("endCreateDt", () => DataUtils.formatStateDate(date));

    String url = "/openapi/service/rest/Covid19/getCovid19SidoInfStateJson";
    final response = await get(url, query: query);
    final document = XmlDocument.parse(response.body);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      var loadList = results
          .map<Covid19CityInfo>((element) => Covid19CityInfo.fromXml(element))
          .toList();
      return loadList;
    } else {
      return [];
    }
  }
}

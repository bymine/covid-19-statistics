import 'package:get/get.dart';

class CityController extends GetxController {
  static CityController get to => Get.find();
  Rx<String> selectedCity = "서울".obs;
  RxList<CityInfo> citys = RxList([]);

  @override
  void onInit() {
    super.onInit();
    loadCityInfo();
  }

  loadCityInfo() {
    List<CityInfo> loadCitys = [
      CityInfo(
          gubun: "서울",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "경기",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "강원",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "세종",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "울산",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "대전",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "광주",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "인천",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "대구",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "부산",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "충남",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "충북",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "전남",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "전북",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "경남",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
      CityInfo(
          gubun: "경북",
          incDec: 123,
          isolClearCnt: 2323,
          localOccCnt: 451421,
          overFlowCnt: 123,
          qurRate: 3,
          stdDay: "2022년 02월 11일 00시"),
    ];

    citys.addAll(loadCitys);
    citys.refresh();
  }

  void changeCity(String value) {
    selectedCity(value);
  }
}

class CityInfo {
  final String gubun;
  final int incDec; //전일 대비 증감수
  final int isolClearCnt;
  final int localOccCnt; // 지역발생 수
  final int overFlowCnt; //해외유입 수
  final int qurRate; //10만명당 발생률
  final String stdDay;

  CityInfo(
      {required this.gubun,
      required this.incDec,
      required this.isolClearCnt,
      required this.localOccCnt,
      required this.overFlowCnt,
      required this.qurRate,
      required this.stdDay});
}

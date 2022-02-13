import 'package:covid19_statistic_app/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class Covid19TotalInfo {
  String stateDate;
  String stateTime;
  String createDt;
  String updateDt;

  int deathCnt;
  int decideCnt;

  Covid19TotalInfo(
      {required this.stateDate,
      required this.stateTime,
      required this.createDt,
      required this.updateDt,
      required this.deathCnt,
      required this.decideCnt});

  factory Covid19TotalInfo.fromXml(XmlElement xml) {
    return Covid19TotalInfo(
      stateDate: XmlUtils.searchResult(xml, "stateDt"),
      stateTime: XmlUtils.searchResult(xml, "stateTime"),
      createDt: XmlUtils.searchResult(xml, "createDt"),
      updateDt: XmlUtils.searchResult(xml, "updateDt"),
      deathCnt: int.parse(XmlUtils.searchResult(xml, "deathCnt")),
      decideCnt: int.parse(XmlUtils.searchResult(xml, "decideCnt")),
    );
  }
}

class Covid19CityInfo {
  String createDt;
  String gubun;

  int incDec; // 전일대비 증감 수
  int deathCnt; //누적 사망자 수
  int defCnt; //누적 확진자 수
  int isolClearCnt; // 격리 해제 수
  int localOccCnt; //지역 발생 수
  int overFlowCnt; // 해외 유입 수
  String qurRate; // 10만명당 발생률

  Covid19CityInfo(
      {required this.createDt,
      required this.gubun,
      required this.incDec,
      required this.deathCnt,
      required this.defCnt,
      required this.isolClearCnt,
      required this.overFlowCnt,
      required this.localOccCnt,
      required this.qurRate});

  factory Covid19CityInfo.fromXml(XmlElement xml) {
    return Covid19CityInfo(
        createDt: XmlUtils.searchResult(xml, "createDt"),
        gubun: XmlUtils.searchResult(xml, "gubun"),
        incDec: int.parse(XmlUtils.searchResult(xml, "incDec")),
        deathCnt: int.parse(XmlUtils.searchResult(xml, "deathCnt")),
        defCnt: int.parse(XmlUtils.searchResult(xml, "defCnt")),
        isolClearCnt: int.parse(XmlUtils.searchResult(xml, "isolClearCnt")),
        overFlowCnt: int.parse(XmlUtils.searchResult(xml, "overFlowCnt")),
        localOccCnt: int.parse(XmlUtils.searchResult(xml, "localOccCnt")),
        qurRate: XmlUtils.searchResult(xml, "qurRate"));
  }
}

import 'package:covid19_statistic_app/src/models/covid19_total.dart';
import 'package:covid19_statistic_app/src/utils/data_utils.dart';
import 'package:get/get.dart';
import 'package:xml/xml.dart';

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

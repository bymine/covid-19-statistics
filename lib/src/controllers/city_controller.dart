import 'package:covid19_statistic_app/src/controllers/total_controller.dart';
import 'package:covid19_statistic_app/src/models/covid19_total.dart';
import 'package:get/get.dart';

class CityController extends GetxController {
  static CityController get to => Get.find();
  RxString currentGugun = "서울".obs;
  RxList<Covid19CityInfo> citys = RxList([]);

  Covid19CityInfo get currnetCity =>
      citys[citys.indexWhere((element) => element.gubun == currentGugun.value)];

  @override
  void onInit() {
    super.onInit();
    loadCityInfo();
  }

  loadCityInfo() async {
    var datas = await Covid19Repository.to
        .loadCitysData(TotalController.to.stateDate.value);
    citys(datas);
    citys.refresh();
  }

  void changeCity(String value) {
    currentGugun(value);
  }
}

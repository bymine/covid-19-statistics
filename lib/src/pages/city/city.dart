import 'package:covid19_statistic_app/src/components/custom_appbar.dart';
import 'package:covid19_statistic_app/src/controllers/city_controller.dart';
import 'package:covid19_statistic_app/src/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            title: '시·도별 발생 현황',
            image: 'assets/svgs/coronadr.svg',
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "시·도별 일일 발생 현황",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Obx(
                  () => CityController.to.citys.isEmpty
                      ? const CircularProgressIndicator()
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.black26),
                          ),
                          child: DropdownButton(
                              underline: Container(),
                              isExpanded: true,
                              value: CityController.to.currentGugun.value,
                              items: CityController.to.citys
                                  .map(
                                    (element) => DropdownMenuItem(
                                      child: Text(element.gubun),
                                      value: element.gubun,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                CityController.to.changeCity(value.toString());
                              })),
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info,
                              color: Colors.black26,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "기준일 " +
                                  DateFormat('yyyy.MM.dd').format(
                                      DateTime.parse(CityController
                                          .to.currnetCity.createDt)),
                              style: const TextStyle(color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.trending_up),
                        title: const Text("전일대비 증감 수"),
                        trailing: Text(DataUtils.formatCountNumber(
                            CityController.to.currnetCity.incDec)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.trending_up),
                        title: const Text("격리 해제 수"),
                        trailing: Text(DataUtils.formatCountNumber(
                            CityController.to.currnetCity.localOccCnt)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.trending_up),
                        title: const Text("해외 유입 수"),
                        trailing: Text(DataUtils.formatCountNumber(
                            CityController.to.currnetCity.overFlowCnt)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.trending_up),
                        title: const Text("누적 사망자 수"),
                        trailing: Text(DataUtils.formatCountNumber(
                            CityController.to.currnetCity.deathCnt)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.trending_up),
                        title: const Text("누적 확진자 수"),
                        trailing: Text(DataUtils.formatCountNumber(
                            CityController.to.currnetCity.defCnt)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.trending_up),
                        title: const Text("누적 확진자 수"),
                        trailing: Text(DataUtils.formatCountNumber(
                            CityController.to.currnetCity.isolClearCnt)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.trending_up),
                        title: const Text("10만명당 발생률"),
                        trailing: Text(DataUtils.formatCountNumber(
                            int.parse(CityController.to.currnetCity.qurRate))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

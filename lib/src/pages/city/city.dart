import 'package:covid19_statistic_app/src/components/custom_appbar.dart';
import 'package:covid19_statistic_app/src/controllers/city_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                              color: Colors.white),
                          child: DropdownButton(
                              underline: Container(),
                              isExpanded: true,
                              value: CityController.to.selectedCity.value,
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
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.trending_up),
                        title: Text(
                          CityController.to.citys.first.incDec.toString(),
                        ),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:covid19_statistic_app/src/controllers/total_controller.dart';
import 'package:covid19_statistic_app/src/pages/total/componets/covid_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartPanel extends StatelessWidget {
  const ChartPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          controller: TotalController.to.controller,
          tabs: TotalController.to.myTabs,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: Get.height * 0.4,
          child: TabBarView(
              controller: TotalController.to.controller,
              children: TotalController.to.myTabs
                  .map<Widget>((Tab tab) => Covid19Chart(
                        type: tab.text == "확진자 추이" ? true : false,
                      ))
                  .toList()),
        )
      ],
    );
  }
}

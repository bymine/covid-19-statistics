import 'package:covid19_statistic_app/src/components/custom_appbar.dart';
import 'package:covid19_statistic_app/src/controllers/total_controller.dart';
import 'package:covid19_statistic_app/src/pages/total/componets/chart_panel.dart';
import 'package:covid19_statistic_app/src/pages/total/componets/count_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalScreen extends GetView<TotalController> {
  const TotalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TotalController.to.weeksData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomAppBar(
                    title: '코로나 발생 현황',
                    image: 'assets/svgs/Drcorona.svg',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CountPanel(),
                  ChartPanel(),
                ],
              ),
            ),
    );
  }
}
